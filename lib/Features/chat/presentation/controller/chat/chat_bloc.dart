import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../message.dart';

part 'chat_state.dart';
part 'chat_event.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  TextEditingController controller = TextEditingController();
  final RecorderController recorderController = RecorderController();
  final PlayerController playerController = PlayerController();
  Timer? _recordingTimer;

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

    // Listen to player events
    playerController.onCompletion.listen((_) {
      add(ChatEvent.pauseVoiceMessage(state.messages.length));
    });
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

  void _onSendImage(SendImage event, Emitter<ChatState> emit) {
    final time = DateFormat('h:mm a').format(DateTime.now());
    final newMessage = ChatMessage(
      content: event.imagePath,
      type: MessageType.image,
      id: state.messages.length,
      isSender: true,
      timing: time,
    );
    emit(state.copyWith(messages: [newMessage, ...state.messages]));
  }

  void _onSendDocument(SendDocument event, Emitter<ChatState> emit) {
    final time = DateFormat('h:mm a').format(DateTime.now());
    final newMessage = ChatMessage(
        content: event.documentPath,
        type: MessageType.document,
        id: state.messages.length,
        isSender: true,
        timing: time);
    emit(state.copyWith(messages: [newMessage, ...state.messages]));
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
      );
      emit(state.copyWith(messages: [newMessage, ...state.messages]));
    }
  }

  void _onPlayVoiceMessage(
      PlayVoiceMessage event, Emitter<ChatState> emit) async {
    await playerController.preparePlayer(path: event.voicePath);
    await playerController.startPlayer();
    emit(state.copyWith(playingMessageId: event.messageId, isPlaying: true));
  }

  void _onPauseVoiceMessage(
      PauseVoiceMessage event, Emitter<ChatState> emit) async {
    await playerController.pausePlayer();
    emit(state.copyWith(playingMessageId: null, isPlaying: false));
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
}
