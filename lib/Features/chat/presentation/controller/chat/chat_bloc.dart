import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../message.dart';

part 'chat_state.dart';
part 'chat_event.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  TextEditingController controller = TextEditingController();
  //final RecorderController recorderController = RecorderController();
  final AudioRecorder record = AudioRecorder();
  final AudioPlayer audioPlayer = AudioPlayer();
  String? _filePath;
  Timer? _recordingTimer;
// int? _currentPlayingMessageId;

  ChatBloc() : super(ChatState.initial()) {
    on<SendMessage>(_onSendMessage);
    on<SendImage>(_onSendImage);
    on<SendDocument>(_onSendDocument);
    on<StartRecording>(_onStartRecording);
    on<SendVoiceRecording>(_onSendVoiceRecording);
    on<PlayVoiceMessage>(_onPlayVoiceMessage);
    on<StopVoiceMessage>(onStopVoiceMessage);
    //on<PauseVoiceMessage>(_onPauseVoiceMessage);
    on<SeekVoiceMessage>(_onSeekVoiceMessage);
    on<RecordingCountDown>((event, emit) => emit(
          state.copyWith(recordingTime: event.secondsRemainin),
        ));
    on<LoadMessagesSuccess>((event, emit) => emit(
          state.copyWith(messages: event.loadedMessages),
        ));
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    final loadedMessages = await loadMessages();
    add(LoadMessagesSuccess(loadedMessages));
  }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) {
    final time = DateFormat('h:mm a').format(DateTime.now());
    if (controller.text.isNotEmpty) {
      final newMessage = ChatMessage(
        content: controller.text,
        type: MessageType.text,
        id: state.messages.length,
        isSender: true,
        timing: time,
      );
      emit(state.copyWith(messages: [newMessage, ...state.messages]));
      controller.clear();
    }
  }

  void _onSendImage(SendImage event, Emitter<ChatState> emit) async {
    final time = DateFormat('h:mm a').format(DateTime.now());
    final newMessage = ChatMessage(
      content: event.imagePath,
      type: MessageType.image,
      id: state.messages.length,
      isSender: true,
      timing: time,
    );
    final imageFile = File(event.imagePath);
    final savedPath =
        await saveFile(imageFile, 'images', 'image_${newMessage.id}.jpg');

    final updatedMessage = newMessage.copyWith(content: savedPath);
    emit(state.copyWith(messages: [updatedMessage, ...state.messages]));
    await saveMessages(state.messages);
  }

  void _onSendDocument(SendDocument event, Emitter<ChatState> emit) async {
    final time = DateFormat('h:mm a').format(DateTime.now());
    final newMessage = ChatMessage(
        content: event.documentPath,
        type: MessageType.document,
        id: state.messages.length,
        isSender: true,
        timing: time);
    final documentFile = File(event.documentPath);
    final savedPath = await saveFile(
        documentFile, 'documents', documentFile.path.split('/').last);

    final updatedMessage = newMessage.copyWith(content: savedPath);
    emit(state.copyWith(messages: [updatedMessage, ...state.messages]));

    await saveMessages(state.messages);
  }

  void _onStartRecording(StartRecording event, Emitter<ChatState> emit) async {
    final permissionStatus = await Permission.microphone.request();

    if (permissionStatus.isGranted) {
      final directory = await getApplicationDocumentsDirectory();
      _filePath =
          '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
      const config = RecordConfig(
        encoder: AudioEncoder.aacLc,
        sampleRate: 44100,
        bitRate: 128000,
      );
      await record.start(config, path: _filePath!);

      int recordingCountDown = 180;
      emit(
          state.copyWith(isRecording: true, recordingTime: recordingCountDown));

      _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        recordingCountDown--;
        if (recordingCountDown <= 0) {
          timer.cancel();
          add(const ChatEvent.sendVoiceRecording());
        } else {
          add(ChatEvent.recordingCountDown(recordingCountDown));
        }
      });
    } else {
      log("Microphone permission denied");
    }
    // await recorderController.record();
    // int recordingCoutDown = 180;
    // emit(state.copyWith(isRecording: true, recordingTime: recordingCoutDown));

    // _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   recordingCoutDown = 180 - timer.tick;
    //   if (recordingCoutDown <= 1) {
    //     timer.cancel();
    //     add(const ChatEvent.sendVoiceRecording());
    //   } else {
    //     add(ChatEvent.recordingCountDown(recordingCoutDown));
    //   }
    // });
  }

  void _onSendVoiceRecording(
      SendVoiceRecording event, Emitter<ChatState> emit) async {
    final time = DateFormat('h:mm a').format(DateTime.now());
    _recordingTimer?.cancel();
    final voicePath = await record.stop();
    emit(state.copyWith(isRecording: false, recordingTime: 180));
    if (voicePath != null && voicePath.isNotEmpty) {
      final voiceFile = File(voicePath);
      final fileSize = voiceFile.length();
      log('${File(voicePath)}');
      log('$fileSize');
      await Future.delayed(const Duration(milliseconds: 500));
      if (await voiceFile.exists()) {
        final newFilePath = await saveFile(voiceFile, 'voice_messages',
            '${DateTime.now().millisecondsSinceEpoch}.aac');

        final newMessage = ChatMessage(
          content: newFilePath,
          type: MessageType.voice,
          id: state.messages.length,
          isSender: true,
          timing: time,
        );

        emit(state.copyWith(messages: [newMessage, ...state.messages]));

        await saveMessages(state.messages);
      } else {
        throw Exception('Voice file does not exist.');
      }
    }
    // await Future.delayed(const Duration(milliseconds: 500));
    // if (voicePath != null) {
    //   final newFilePath = await saveFile(File(voicePath), 'voice_messages',
    //       '${DateTime.now().millisecondsSinceEpoch}.aac');
    //   final newMessage = ChatMessage(
    //     content: newFilePath,
    //     type: MessageType.voice,
    //     id: state.messages.length,
    //     isSender: true,
    //     timing: time,
    //     // playerController: PlayerController(),
    //   );
    //   emit(state.copyWith(messages: [newMessage, ...state.messages]));
    //   await saveMessages(state.messages);
    // }
  }

  void _onPlayVoiceMessage(
      PlayVoiceMessage event, Emitter<ChatState> emit) async {
    final message = state.messages.firstWhere((m) => m.id == event.messageId);

    if (message.isPlaying) {
      await event.player.pause();
      emit(state.copyWith(
          messages: state.messages.map((m) {
        if (m.id == event.messageId) {
          return m.copyWith(isPlaying: false);
        }
        return m;
      }).toList()));
    } else {
      await event.player.setFilePath(message.content);
      await event.player.play();
      emit(state.copyWith(
          messages: state.messages.map((m) {
        if (m.id == event.messageId) {
          return m.copyWith(
              isPlaying: true, totalDuration: event.player.duration!);
        }
        return m;
      }).toList()));

      event.player.positionStream.listen((position) {
        add(ChatEvent.updatePosition(event.messageId, position));
      });

      event.player.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          add(ChatEvent.stopVoiceMessage(event.messageId));
        }
      });
    }
  }

  void onUpdatePosition(UpdatePosition event, Emitter<ChatState> emit) {
    // final message = state.messages.firstWhere((m) => m.id == event.messageId);
    emit(state.copyWith(
        messages: state.messages.map((m) {
      if (m.id == event.messageId) {
        return m.copyWith(currentPosition: event.position);
      }
      return m;
    }).toList()));
  }

  void onStopVoiceMessage(StopVoiceMessage event, Emitter<ChatState> emit) {
    //final message = state.messages.firstWhere((m) => m.id == event.messageId);
    emit(state.copyWith(
        messages: state.messages.map((m) {
      if (m.id == event.messageId) {
        return m.copyWith(isPlaying: false, currentPosition: Duration.zero);
      }
      return m;
    }).toList()));
  }

  void _onSeekVoiceMessage(
      SeekVoiceMessage event, Emitter<ChatState> emit) async {
    // final message = state.messages.firstWhere((m) => m.id == event.messageId);
    final player = AudioPlayer();
    await player.seek(event.seekPosition);
    emit(state.copyWith(
        messages: state.messages.map((m) {
      if (m.id == event.messageId) {
        return m.copyWith(currentPosition: event.seekPosition);
      }
      return m;
    }).toList()));
  }

  //   final updatedMessages = state.messages.map((m) {
  //     return m.id == event.messageId ? m.copyWith(isPlaying: false) : m;
  //   }).toList();

  //   emit(state.copyWith(messages: updatedMessages, playingMessageId: null));
  // }

  // void _onSeekVoiceMessage(
  //     SeekVoiceMessage event, Emitter<ChatState> emit) async {
  //   await audioPlayer.seek(event.seekPosition);
  // }

  // void onSliderValueChanged(double value) async {
  //   final position = Duration(seconds: value.toInt());
  //   await audioPlayer.seek(position);
  // }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null && result.files.single.path != null) {
      add(ChatEvent.sendDocument(result.files.single.path!));
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      add(
        ChatEvent.sendImage(image.path),
      );
    }
  }

  Future<String> saveFile(File file, String folderName, String fileName) async {
    try {
      // Get the app's document directory (which is persistent storage)
      final directory = await getApplicationDocumentsDirectory();

      // Create the 'voice_messages' directory if it doesn't exist
      final saveDir = Directory('${directory.path}/$folderName');
      if (!(await saveDir.exists())) {
        await saveDir.create(recursive: true);
      }

      // Set the file path to the new directory
      final newPath = '${saveDir.path}/$fileName';

      // Copy the file to the new directory
      final newFile = await file.copy(newPath);

      return newFile.path; // Return the path of the newly saved file
    } catch (e) {
      throw Exception('Error saving file: $e');
    }
    // final directory = await getApplicationDocumentsDirectory();
    // final path = '${directory.path}/$folderName';

    // await Directory(path).create(recursive: true);

    // final filePath = '$path/$fileName';
    // final newFile = await file.copy(filePath);
    // return newFile.path;
  }

  Future<File> getFile(String folderName, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$folderName/$fileName';
    return File(path);
  }

  Future<void> saveMessages(List<ChatMessage> messages) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString =
        jsonEncode(messages.map((message) => message.toJson()).toList());
    await prefs.setString('messages', jsonString);
  }

  Future<List<ChatMessage>> loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('messages');
    if (jsonString != null) {
      final jsonData = jsonDecode(jsonString) as List<dynamic>;
      return jsonData.map((json) => ChatMessage.fromJson(json)).toList();
    }
    return [];
  }

  // Future<String?> extractFirstPageImage(String pdfPath) async {

  //   final document = PdfImageRendererPdf(path: pdfPath);
  //   await document.open();
  //   await document.openPage(pageIndex: 0);
  //   //final page = await document.openPage(pageIndex: 0);
  //   final image = await document.renderPage(
  //     pageIndex: 0,
  //     width: 300,
  //     height: 400,
  //     scale: 1,
  //     //format: PdfImageRendererFormat.png,
  //   );

  //   final directory = await getApplicationDocumentsDirectory();
  //   final imagePath =
  //       '${directory.path}/images/first_page_${DateTime.now().millisecondsSinceEpoch}.png';
  //   final file = File(imagePath);
  //   //await file.writeAsBytes(image);

  //   if (image != null) {
  //     await file.writeAsBytes(image);
  //   }

  //   // Close the page and document
  //   await document.closePage(pageIndex: 0);
  //   await document.close();

  //   return imagePath;
  // }

  @override
  Future<void> close() {
    record.dispose();
    controller.dispose();
    _recordingTimer?.cancel();
    return super.close();
  }
}
