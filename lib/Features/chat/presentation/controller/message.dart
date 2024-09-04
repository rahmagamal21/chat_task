import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

enum MessageType { text, image, document, voice }

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required int id,
    required String content,
    required MessageType type,
    required bool isSender,
    required String timing,
  }) = _Message;
}
