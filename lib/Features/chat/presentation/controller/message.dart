import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

enum MessageType { text, image, document, voice }

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required int id,
    required String content,
    required MessageType type,
    required bool isSender,
    required String timing,
    @JsonKey(ignore: true) PlayerController? playerController,
    //@Default(null) PlayerController? playerController,
    @Default(false) bool isPlaying,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

//   Map<String, dynamic> toJson() {
//     final json = _$ChatMessageToJson(this);
//     json.remove('playerController');
//     return json;
//   }
}
