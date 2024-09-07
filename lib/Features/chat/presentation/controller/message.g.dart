// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      isSender: json['isSender'] as bool,
      timing: json['timing'] as String,
      isPlaying: json['isPlaying'] as bool? ?? false,
      currentPosition: json['currentPosition'] == null
          ? Duration.zero
          : Duration(microseconds: (json['currentPosition'] as num).toInt()),
      totalDuration: json['totalDuration'] == null
          ? Duration.zero
          : Duration(microseconds: (json['totalDuration'] as num).toInt()),
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'isSender': instance.isSender,
      'timing': instance.timing,
      'isPlaying': instance.isPlaying,
      'currentPosition': instance.currentPosition.inMicroseconds,
      'totalDuration': instance.totalDuration.inMicroseconds,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.document: 'document',
  MessageType.voice: 'voice',
};
