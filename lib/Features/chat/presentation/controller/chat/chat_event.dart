part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.sendMessage() = SendMessage;
  const factory ChatEvent.sendImage(String imagePath) = SendImage;
  const factory ChatEvent.sendDocument(String documentPath) = SendDocument;
  const factory ChatEvent.startRecording() = StartRecording;
  const factory ChatEvent.recordingCountDown(int secondsRemainin) =
      RecordingCountDown;
  const factory ChatEvent.sendVoiceRecording() = SendVoiceRecording;
  // const factory ChatEvent.playVoiceMessage(String voicePath, int messageId) =
  //     PlayVoiceMessage;
  const factory ChatEvent.playVoiceMessage(int messageId, AudioPlayer player) =
      PlayVoiceMessage;
  const factory ChatEvent.pauseVoiceMessage(int messageId, AudioPlayer player) =
      PauseVoiceMessage;
  const factory ChatEvent.updatePosition(int messageId, Duration position) =
      UpdatePosition;
  const factory ChatEvent.stopVoiceMessage(int messageId, AudioPlayer player) =
      StopVoiceMessage;
  const factory ChatEvent.seekVoiceMessage(
          int messageId, Duration seekPosition, AudioPlayer player) =
      SeekVoiceMessage;
  const factory ChatEvent.loadMessagesSuccess(
      List<ChatMessage> loadedMessages) = LoadMessagesSuccess;
}
