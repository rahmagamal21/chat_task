import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../message.dart';

part 'chat_state.dart';
part 'chat_event.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  TextEditingController controller = TextEditingController();
  final RecorderController recorderController = RecorderController();
  ChatBloc() : super(ChatState.initial()) {
    on<SendMessage>(_onSendMessage);
    on<SendImage>(_onSendImage);
    on<SendDocument>(_onSendDocument);
    on<StartRecording>(_onStartRecording);
    on<SendVoiceRecording>(_onSendVoiceRecording);
    // on<ChatEvent>((event, emit) async {
    //   if (event is _SendMessage) {
    //     // Handle text message
    //     final newMessage = ChatMessage(
    //       content: event.message,
    //       type: MessageType.text,
    //       id: state.messages.length,
    //       isSender: true,
    //     );
    //     _addMessage(emit, newMessage);
    //   } else if (event is _SendImage) {
    //     // Handle image
    //     final newMessage = ChatMessage(
    //       content: event.imagePath,
    //       type: MessageType.image,
    //       id: state.messages.length,
    //       isSender: true,
    //     );
    //     _addMessage(emit, newMessage);
    //   } else if (event is _SendDocument) {
    //     // Handle document
    //     final newMessage = ChatMessage(
    //       content: event.documentPath,
    //       type: MessageType.document,
    //       id: state.messages.length,
    //       isSender: true,
    //     );
    //     _addMessage(emit, newMessage);
    //   } else if (event is _SendVoiceRecording) {
    //     // Handle voice recording
    //     final newMessage = ChatMessage(
    //       content: event.voicePath,
    //       type: MessageType.voice,
    //       id: state.messages.length,
    //       isSender: true,
    //     );
    //     _addMessage(emit, newMessage);
    //   }
    // });
  }

  // void _addMessage(Emitter<ChatState> emit, ChatMessage newMessage) {
  //   if (state is _Loaded) {
  //     final loadedState = state as _Loaded;
  //     final updatedMessages = List<ChatMessage>.from(loadedState.messages)
  //       ..add(newMessage);
  //     emit(ChatState.loaded(updatedMessages));
  //   } else {
  //     emit(ChatState.loaded([newMessage]));
  //   }
  // }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) {
    if (controller.text.isNotEmpty) {
      final newMessage = ChatMessage(
        content: controller.text,
        type: MessageType.text,
        id: state.messages.length,
        isSender: true,
      );
      emit(state.copyWith(messages: [newMessage, ...state.messages]));
      controller.clear();
    }
  }

  void _onSendImage(SendImage event, Emitter<ChatState> emit) {
    final newMessage = ChatMessage(
      content: event.imagePath,
      type: MessageType.image,
      id: state.messages.length,
      isSender: true,
    );
    emit(state.copyWith(messages: [newMessage, ...state.messages]));
  }

  void _onSendDocument(SendDocument event, Emitter<ChatState> emit) {
    final newMessage = ChatMessage(
      content: event.documentPath,
      type: MessageType.document,
      id: state.messages.length,
      isSender: true,
    );
    emit(state.copyWith(messages: [newMessage, ...state.messages]));
  }

  void _onStartRecording(StartRecording event, Emitter<ChatState> emit) async {
    recorderController.record();
    emit(state.copyWith(isRecording: true, recordingTime: 180));

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.recordingTime <= 1) {
        timer.cancel();
        add(const ChatEvent.sendVoiceRecording(''));
      } else {
        emit(state.copyWith(recordingTime: state.recordingTime - 1));
      }
    });
  }

  void _onSendVoiceRecording(
      SendVoiceRecording event, Emitter<ChatState> emit) async {
    final voicePath = await recorderController.stop();
    emit(state.copyWith(isRecording: false, recordingTime: 180));
    final newMessage = ChatMessage(
      content: voicePath ?? '',
      type: MessageType.voice,
      id: state.messages.length,
      isSender: true,
    );
    emit(state.copyWith(messages: [newMessage, ...state.messages]));
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
      add(ChatEvent.sendImage(image.path));
    }
  }
}
