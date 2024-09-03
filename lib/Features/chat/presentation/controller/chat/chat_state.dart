part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    required List<ChatMessage> messages,
    required bool isRecording,
    required int recordingTime,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState(
        messages: [],
        isRecording: false,
        recordingTime: 180,
      );
  // const factory ChatState.initial() = _Initial;
  // const factory ChatState.loading() = _Loading;
  // const factory ChatState.loaded(List<ChatMessage> messages) = _Loaded;
  // const factory ChatState.error(String message) = _Error;
}

// class ChatMessage {
//   final String content;
//   final MessageType type;

//   ChatMessage({required this.content, required this.type});
// }

// enum MessageType {
//   text,
//   image,
//   document,
//   voice,
// }
