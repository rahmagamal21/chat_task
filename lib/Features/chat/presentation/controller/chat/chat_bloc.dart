import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../message.dart';

part 'chat_state.dart';
part 'chat_event.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  TextEditingController controller = TextEditingController();
  final RecorderController recorderController = RecorderController();
  Timer? _recordingTimer;
  // int? _currentPlayingMessageId;

  ChatBloc() : super(ChatState.initial()) {
    on<SendMessage>(_onSendMessage);
    on<SendImage>(_onSendImage);
    on<SendDocument>(_onSendDocument);
    on<StartRecording>(_onStartRecording);
    on<SendVoiceRecording>(_onSendVoiceRecording);
    on<PlayVoiceMessage>(_onPlayVoiceMessage);
    on<PauseVoiceMessage>(_onPauseVoiceMessage);
    on<RecordingCountDown>((event, emit) => emit(
          state.copyWith(recordingTime: event.secondsRemainin),
        ));
    on<LoadMessagesSuccess>((event, emit) => emit(
          state.copyWith(messages: event.loadedMessages),
        ));
    _loadMessages();

    // Listen to player events
    // playerController.onCompletion.listen((_) {
    //   if (_currentPlayingMessageId != null) {
    //     add(ChatEvent.pauseVoiceMessage(_currentPlayingMessageId!));
    //     _currentPlayingMessageId = null;
    //   }
    // });
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
        documentFile, 'documents', 'document_${newMessage.id}.pdf');

    final updatedMessage = newMessage.copyWith(content: savedPath);
    emit(state.copyWith(messages: [updatedMessage, ...state.messages]));

    await saveMessages(state.messages);
  }

  void _onStartRecording(StartRecording event, Emitter<ChatState> emit) async {
    await recorderController.record();
    int recordingCoutDown = 180;
    emit(state.copyWith(isRecording: true, recordingTime: recordingCoutDown));

    _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      recordingCoutDown = 180 - timer.tick;
      if (recordingCoutDown <= 1) {
        timer.cancel();
        add(const ChatEvent.sendVoiceRecording());
      } else {
        add(ChatEvent.recordingCountDown(recordingCoutDown));
      }
    });
  }

  void _onSendVoiceRecording(
      SendVoiceRecording event, Emitter<ChatState> emit) async {
    final time = DateFormat('h:mm a').format(DateTime.now());
    _recordingTimer?.cancel();
    final voicePath = await recorderController.stop();
    emit(state.copyWith(isRecording: false, recordingTime: 180));
    if (voicePath != null) {
      final newMessage = ChatMessage(
        content: voicePath,
        type: MessageType.voice,
        id: state.messages.length,
        isSender: true,
        timing: time,
        //playerController: PlayerController(),
      );
      emit(state.copyWith(messages: [newMessage, ...state.messages]));
      await saveMessages(state.messages);
    }
  }

  void _onPlayVoiceMessage(
      PlayVoiceMessage event, Emitter<ChatState> emit) async {
    final message = state.messages[event.messageId];
    final playerController = PlayerController();

    if (state.playingMessageId != null &&
        state.playingMessageId != message.id) {
      // final currentPlayingMessage =
      //     state.messages.firstWhere((m) => m.id == state.playingMessageId);
      await PlayerController().pausePlayer();
      emit(state.copyWith(
        messages: state.messages.map((m) {
          return m.id == state.playingMessageId
              ? m.copyWith(isPlaying: false)
              : m;
        }).toList(),
        playingMessageId: null,
      ));
    }

    await playerController.preparePlayer(path: message.content);
    await playerController.startPlayer();

    playerController.onCompletion.listen((_) {
      add(PauseVoiceMessage(message.id));
    });

    final updatedMessages = state.messages.map((m) {
      return m.id == event.messageId
          ? m.copyWith(isPlaying: true)
          : m.copyWith(isPlaying: false);
    }).toList();

    emit(state.copyWith(
      messages: updatedMessages,
      playingMessageId: event.messageId,
    ));
    // final message = state.messages[event.messageId];
    // final playerController = message.playerController!;

    // await playerController.preparePlayer(path: message.content);
    // await playerController.startPlayer();

    // final updatedMessages = state.messages.map((m) {
    //   return m.id == event.messageId
    //       ? m.copyWith(isPlaying: true)
    //       : m.copyWith(isPlaying: false);
    // }).toList();

    // emit(state.copyWith(
    //     messages: updatedMessages, playingMessageId: event.messageId));

    // if (_currentPlayingMessageId != null &&
    //     _currentPlayingMessageId != event.messageId) {
    //   await playerController.pausePlayer();
    //   add(ChatEvent.pauseVoiceMessage(_currentPlayingMessageId!));
    // }
    // await playerController.preparePlayer(path: event.voicePath);
    // await playerController.startPlayer();
    // _currentPlayingMessageId = event.messageId;
    // emit(state.copyWith(playingMessageId: event.messageId, isPlaying: true));
  }

  void _onPauseVoiceMessage(
      PauseVoiceMessage event, Emitter<ChatState> emit) async {
    //final message = state.messages[event.messageId];
    final playerController = PlayerController();
    await playerController.pausePlayer();
    final updatedMessages = state.messages.map((m) {
      return m.id == event.messageId ? m.copyWith(isPlaying: false) : m;
    }).toList();

    emit(state.copyWith(messages: updatedMessages, playingMessageId: null));
    // if (_currentPlayingMessageId == event.messageId) {
    //   _currentPlayingMessageId = null;
    // }
    // emit(state.copyWith(playingMessageId: null, isPlaying: false));
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      add(ChatEvent.sendDocument(result.files.first.path!));
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
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$folderName';

    await Directory(path).create(recursive: true);

    final filePath = '$path/$fileName';
    final newFile = await file.copy(filePath);
    return newFile.path;
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
    //playerController.dispose();
    recorderController.dispose();
    controller.dispose();
    _recordingTimer?.cancel();
    return super.close();
  }
}
