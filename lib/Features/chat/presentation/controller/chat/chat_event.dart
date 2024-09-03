part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.sendMessage() = SendMessage;
  const factory ChatEvent.sendImage(String imagePath) = SendImage;
  const factory ChatEvent.sendDocument(String documentPath) = SendDocument;
  const factory ChatEvent.startRecording() = StartRecording;
  const factory ChatEvent.sendVoiceRecording(String voicePath) =
      SendVoiceRecording;
}
