// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatState {
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  bool get isRecording => throw _privateConstructorUsedError;
  int get recordingTime => throw _privateConstructorUsedError;
  int? get playingMessageId => throw _privateConstructorUsedError;
  bool? get isPlaying => throw _privateConstructorUsedError;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {List<ChatMessage> messages,
      bool isRecording,
      int recordingTime,
      int? playingMessageId,
      bool? isPlaying});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isRecording = null,
    Object? recordingTime = null,
    Object? playingMessageId = freezed,
    Object? isPlaying = freezed,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      recordingTime: null == recordingTime
          ? _value.recordingTime
          : recordingTime // ignore: cast_nullable_to_non_nullable
              as int,
      playingMessageId: freezed == playingMessageId
          ? _value.playingMessageId
          : playingMessageId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPlaying: freezed == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChatMessage> messages,
      bool isRecording,
      int recordingTime,
      int? playingMessageId,
      bool? isPlaying});
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isRecording = null,
    Object? recordingTime = null,
    Object? playingMessageId = freezed,
    Object? isPlaying = freezed,
  }) {
    return _then(_$ChatStateImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      recordingTime: null == recordingTime
          ? _value.recordingTime
          : recordingTime // ignore: cast_nullable_to_non_nullable
              as int,
      playingMessageId: freezed == playingMessageId
          ? _value.playingMessageId
          : playingMessageId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPlaying: freezed == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl(
      {required final List<ChatMessage> messages,
      required this.isRecording,
      required this.recordingTime,
      this.playingMessageId,
      this.isPlaying})
      : _messages = messages;

  final List<ChatMessage> _messages;
  @override
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final bool isRecording;
  @override
  final int recordingTime;
  @override
  final int? playingMessageId;
  @override
  final bool? isPlaying;

  @override
  String toString() {
    return 'ChatState(messages: $messages, isRecording: $isRecording, recordingTime: $recordingTime, playingMessageId: $playingMessageId, isPlaying: $isPlaying)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.recordingTime, recordingTime) ||
                other.recordingTime == recordingTime) &&
            (identical(other.playingMessageId, playingMessageId) ||
                other.playingMessageId == playingMessageId) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_messages),
      isRecording,
      recordingTime,
      playingMessageId,
      isPlaying);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {required final List<ChatMessage> messages,
      required final bool isRecording,
      required final int recordingTime,
      final int? playingMessageId,
      final bool? isPlaying}) = _$ChatStateImpl;

  @override
  List<ChatMessage> get messages;
  @override
  bool get isRecording;
  @override
  int get recordingTime;
  @override
  int? get playingMessageId;
  @override
  bool? get isPlaying;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendMessage,
    required TResult Function(String imagePath) sendImage,
    required TResult Function(String documentPath) sendDocument,
    required TResult Function() startRecording,
    required TResult Function(int secondsRemainin) recordingCountDown,
    required TResult Function() sendVoiceRecording,
    required TResult Function(String voicePath, int messageId) playVoiceMessage,
    required TResult Function(int messageId) pauseVoiceMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendMessage,
    TResult? Function(String imagePath)? sendImage,
    TResult? Function(String documentPath)? sendDocument,
    TResult? Function()? startRecording,
    TResult? Function(int secondsRemainin)? recordingCountDown,
    TResult? Function()? sendVoiceRecording,
    TResult? Function(String voicePath, int messageId)? playVoiceMessage,
    TResult? Function(int messageId)? pauseVoiceMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendMessage,
    TResult Function(String imagePath)? sendImage,
    TResult Function(String documentPath)? sendDocument,
    TResult Function()? startRecording,
    TResult Function(int secondsRemainin)? recordingCountDown,
    TResult Function()? sendVoiceRecording,
    TResult Function(String voicePath, int messageId)? playVoiceMessage,
    TResult Function(int messageId)? pauseVoiceMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendDocument value) sendDocument,
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(RecordingCountDown value) recordingCountDown,
    required TResult Function(SendVoiceRecording value) sendVoiceRecording,
    required TResult Function(PlayVoiceMessage value) playVoiceMessage,
    required TResult Function(PauseVoiceMessage value) pauseVoiceMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendDocument value)? sendDocument,
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(RecordingCountDown value)? recordingCountDown,
    TResult? Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult? Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult? Function(PauseVoiceMessage value)? pauseVoiceMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendDocument value)? sendDocument,
    TResult Function(StartRecording value)? startRecording,
    TResult Function(RecordingCountDown value)? recordingCountDown,
    TResult Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult Function(PauseVoiceMessage value)? pauseVoiceMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendMessageImpl implements SendMessage {
  const _$SendMessageImpl();

  @override
  String toString() {
    return 'ChatEvent.sendMessage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendMessageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendMessage,
    required TResult Function(String imagePath) sendImage,
    required TResult Function(String documentPath) sendDocument,
    required TResult Function() startRecording,
    required TResult Function(int secondsRemainin) recordingCountDown,
    required TResult Function() sendVoiceRecording,
    required TResult Function(String voicePath, int messageId) playVoiceMessage,
    required TResult Function(int messageId) pauseVoiceMessage,
  }) {
    return sendMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendMessage,
    TResult? Function(String imagePath)? sendImage,
    TResult? Function(String documentPath)? sendDocument,
    TResult? Function()? startRecording,
    TResult? Function(int secondsRemainin)? recordingCountDown,
    TResult? Function()? sendVoiceRecording,
    TResult? Function(String voicePath, int messageId)? playVoiceMessage,
    TResult? Function(int messageId)? pauseVoiceMessage,
  }) {
    return sendMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendMessage,
    TResult Function(String imagePath)? sendImage,
    TResult Function(String documentPath)? sendDocument,
    TResult Function()? startRecording,
    TResult Function(int secondsRemainin)? recordingCountDown,
    TResult Function()? sendVoiceRecording,
    TResult Function(String voicePath, int messageId)? playVoiceMessage,
    TResult Function(int messageId)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendDocument value) sendDocument,
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(RecordingCountDown value) recordingCountDown,
    required TResult Function(SendVoiceRecording value) sendVoiceRecording,
    required TResult Function(PlayVoiceMessage value) playVoiceMessage,
    required TResult Function(PauseVoiceMessage value) pauseVoiceMessage,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendDocument value)? sendDocument,
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(RecordingCountDown value)? recordingCountDown,
    TResult? Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult? Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult? Function(PauseVoiceMessage value)? pauseVoiceMessage,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendDocument value)? sendDocument,
    TResult Function(StartRecording value)? startRecording,
    TResult Function(RecordingCountDown value)? recordingCountDown,
    TResult Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult Function(PauseVoiceMessage value)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class SendMessage implements ChatEvent {
  const factory SendMessage() = _$SendMessageImpl;
}

/// @nodoc
abstract class _$$SendImageImplCopyWith<$Res> {
  factory _$$SendImageImplCopyWith(
          _$SendImageImpl value, $Res Function(_$SendImageImpl) then) =
      __$$SendImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String imagePath});
}

/// @nodoc
class __$$SendImageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendImageImpl>
    implements _$$SendImageImplCopyWith<$Res> {
  __$$SendImageImplCopyWithImpl(
      _$SendImageImpl _value, $Res Function(_$SendImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
  }) {
    return _then(_$SendImageImpl(
      null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendImageImpl implements SendImage {
  const _$SendImageImpl(this.imagePath);

  @override
  final String imagePath;

  @override
  String toString() {
    return 'ChatEvent.sendImage(imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendImageImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendImageImplCopyWith<_$SendImageImpl> get copyWith =>
      __$$SendImageImplCopyWithImpl<_$SendImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendMessage,
    required TResult Function(String imagePath) sendImage,
    required TResult Function(String documentPath) sendDocument,
    required TResult Function() startRecording,
    required TResult Function(int secondsRemainin) recordingCountDown,
    required TResult Function() sendVoiceRecording,
    required TResult Function(String voicePath, int messageId) playVoiceMessage,
    required TResult Function(int messageId) pauseVoiceMessage,
  }) {
    return sendImage(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendMessage,
    TResult? Function(String imagePath)? sendImage,
    TResult? Function(String documentPath)? sendDocument,
    TResult? Function()? startRecording,
    TResult? Function(int secondsRemainin)? recordingCountDown,
    TResult? Function()? sendVoiceRecording,
    TResult? Function(String voicePath, int messageId)? playVoiceMessage,
    TResult? Function(int messageId)? pauseVoiceMessage,
  }) {
    return sendImage?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendMessage,
    TResult Function(String imagePath)? sendImage,
    TResult Function(String documentPath)? sendDocument,
    TResult Function()? startRecording,
    TResult Function(int secondsRemainin)? recordingCountDown,
    TResult Function()? sendVoiceRecording,
    TResult Function(String voicePath, int messageId)? playVoiceMessage,
    TResult Function(int messageId)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (sendImage != null) {
      return sendImage(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendDocument value) sendDocument,
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(RecordingCountDown value) recordingCountDown,
    required TResult Function(SendVoiceRecording value) sendVoiceRecording,
    required TResult Function(PlayVoiceMessage value) playVoiceMessage,
    required TResult Function(PauseVoiceMessage value) pauseVoiceMessage,
  }) {
    return sendImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendDocument value)? sendDocument,
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(RecordingCountDown value)? recordingCountDown,
    TResult? Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult? Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult? Function(PauseVoiceMessage value)? pauseVoiceMessage,
  }) {
    return sendImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendDocument value)? sendDocument,
    TResult Function(StartRecording value)? startRecording,
    TResult Function(RecordingCountDown value)? recordingCountDown,
    TResult Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult Function(PauseVoiceMessage value)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (sendImage != null) {
      return sendImage(this);
    }
    return orElse();
  }
}

abstract class SendImage implements ChatEvent {
  const factory SendImage(final String imagePath) = _$SendImageImpl;

  String get imagePath;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendImageImplCopyWith<_$SendImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendDocumentImplCopyWith<$Res> {
  factory _$$SendDocumentImplCopyWith(
          _$SendDocumentImpl value, $Res Function(_$SendDocumentImpl) then) =
      __$$SendDocumentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String documentPath});
}

/// @nodoc
class __$$SendDocumentImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendDocumentImpl>
    implements _$$SendDocumentImplCopyWith<$Res> {
  __$$SendDocumentImplCopyWithImpl(
      _$SendDocumentImpl _value, $Res Function(_$SendDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentPath = null,
  }) {
    return _then(_$SendDocumentImpl(
      null == documentPath
          ? _value.documentPath
          : documentPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendDocumentImpl implements SendDocument {
  const _$SendDocumentImpl(this.documentPath);

  @override
  final String documentPath;

  @override
  String toString() {
    return 'ChatEvent.sendDocument(documentPath: $documentPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendDocumentImpl &&
            (identical(other.documentPath, documentPath) ||
                other.documentPath == documentPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentPath);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendDocumentImplCopyWith<_$SendDocumentImpl> get copyWith =>
      __$$SendDocumentImplCopyWithImpl<_$SendDocumentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendMessage,
    required TResult Function(String imagePath) sendImage,
    required TResult Function(String documentPath) sendDocument,
    required TResult Function() startRecording,
    required TResult Function(int secondsRemainin) recordingCountDown,
    required TResult Function() sendVoiceRecording,
    required TResult Function(String voicePath, int messageId) playVoiceMessage,
    required TResult Function(int messageId) pauseVoiceMessage,
  }) {
    return sendDocument(documentPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendMessage,
    TResult? Function(String imagePath)? sendImage,
    TResult? Function(String documentPath)? sendDocument,
    TResult? Function()? startRecording,
    TResult? Function(int secondsRemainin)? recordingCountDown,
    TResult? Function()? sendVoiceRecording,
    TResult? Function(String voicePath, int messageId)? playVoiceMessage,
    TResult? Function(int messageId)? pauseVoiceMessage,
  }) {
    return sendDocument?.call(documentPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendMessage,
    TResult Function(String imagePath)? sendImage,
    TResult Function(String documentPath)? sendDocument,
    TResult Function()? startRecording,
    TResult Function(int secondsRemainin)? recordingCountDown,
    TResult Function()? sendVoiceRecording,
    TResult Function(String voicePath, int messageId)? playVoiceMessage,
    TResult Function(int messageId)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (sendDocument != null) {
      return sendDocument(documentPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendDocument value) sendDocument,
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(RecordingCountDown value) recordingCountDown,
    required TResult Function(SendVoiceRecording value) sendVoiceRecording,
    required TResult Function(PlayVoiceMessage value) playVoiceMessage,
    required TResult Function(PauseVoiceMessage value) pauseVoiceMessage,
  }) {
    return sendDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendDocument value)? sendDocument,
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(RecordingCountDown value)? recordingCountDown,
    TResult? Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult? Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult? Function(PauseVoiceMessage value)? pauseVoiceMessage,
  }) {
    return sendDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendDocument value)? sendDocument,
    TResult Function(StartRecording value)? startRecording,
    TResult Function(RecordingCountDown value)? recordingCountDown,
    TResult Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult Function(PauseVoiceMessage value)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (sendDocument != null) {
      return sendDocument(this);
    }
    return orElse();
  }
}

abstract class SendDocument implements ChatEvent {
  const factory SendDocument(final String documentPath) = _$SendDocumentImpl;

  String get documentPath;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendDocumentImplCopyWith<_$SendDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartRecordingImplCopyWith<$Res> {
  factory _$$StartRecordingImplCopyWith(_$StartRecordingImpl value,
          $Res Function(_$StartRecordingImpl) then) =
      __$$StartRecordingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartRecordingImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$StartRecordingImpl>
    implements _$$StartRecordingImplCopyWith<$Res> {
  __$$StartRecordingImplCopyWithImpl(
      _$StartRecordingImpl _value, $Res Function(_$StartRecordingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartRecordingImpl implements StartRecording {
  const _$StartRecordingImpl();

  @override
  String toString() {
    return 'ChatEvent.startRecording()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartRecordingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendMessage,
    required TResult Function(String imagePath) sendImage,
    required TResult Function(String documentPath) sendDocument,
    required TResult Function() startRecording,
    required TResult Function(int secondsRemainin) recordingCountDown,
    required TResult Function() sendVoiceRecording,
    required TResult Function(String voicePath, int messageId) playVoiceMessage,
    required TResult Function(int messageId) pauseVoiceMessage,
  }) {
    return startRecording();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendMessage,
    TResult? Function(String imagePath)? sendImage,
    TResult? Function(String documentPath)? sendDocument,
    TResult? Function()? startRecording,
    TResult? Function(int secondsRemainin)? recordingCountDown,
    TResult? Function()? sendVoiceRecording,
    TResult? Function(String voicePath, int messageId)? playVoiceMessage,
    TResult? Function(int messageId)? pauseVoiceMessage,
  }) {
    return startRecording?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendMessage,
    TResult Function(String imagePath)? sendImage,
    TResult Function(String documentPath)? sendDocument,
    TResult Function()? startRecording,
    TResult Function(int secondsRemainin)? recordingCountDown,
    TResult Function()? sendVoiceRecording,
    TResult Function(String voicePath, int messageId)? playVoiceMessage,
    TResult Function(int messageId)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (startRecording != null) {
      return startRecording();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendDocument value) sendDocument,
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(RecordingCountDown value) recordingCountDown,
    required TResult Function(SendVoiceRecording value) sendVoiceRecording,
    required TResult Function(PlayVoiceMessage value) playVoiceMessage,
    required TResult Function(PauseVoiceMessage value) pauseVoiceMessage,
  }) {
    return startRecording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendDocument value)? sendDocument,
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(RecordingCountDown value)? recordingCountDown,
    TResult? Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult? Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult? Function(PauseVoiceMessage value)? pauseVoiceMessage,
  }) {
    return startRecording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendDocument value)? sendDocument,
    TResult Function(StartRecording value)? startRecording,
    TResult Function(RecordingCountDown value)? recordingCountDown,
    TResult Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult Function(PauseVoiceMessage value)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (startRecording != null) {
      return startRecording(this);
    }
    return orElse();
  }
}

abstract class StartRecording implements ChatEvent {
  const factory StartRecording() = _$StartRecordingImpl;
}

/// @nodoc
abstract class _$$RecordingCountDownImplCopyWith<$Res> {
  factory _$$RecordingCountDownImplCopyWith(_$RecordingCountDownImpl value,
          $Res Function(_$RecordingCountDownImpl) then) =
      __$$RecordingCountDownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int secondsRemainin});
}

/// @nodoc
class __$$RecordingCountDownImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$RecordingCountDownImpl>
    implements _$$RecordingCountDownImplCopyWith<$Res> {
  __$$RecordingCountDownImplCopyWithImpl(_$RecordingCountDownImpl _value,
      $Res Function(_$RecordingCountDownImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secondsRemainin = null,
  }) {
    return _then(_$RecordingCountDownImpl(
      null == secondsRemainin
          ? _value.secondsRemainin
          : secondsRemainin // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RecordingCountDownImpl implements RecordingCountDown {
  const _$RecordingCountDownImpl(this.secondsRemainin);

  @override
  final int secondsRemainin;

  @override
  String toString() {
    return 'ChatEvent.recordingCountDown(secondsRemainin: $secondsRemainin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingCountDownImpl &&
            (identical(other.secondsRemainin, secondsRemainin) ||
                other.secondsRemainin == secondsRemainin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secondsRemainin);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingCountDownImplCopyWith<_$RecordingCountDownImpl> get copyWith =>
      __$$RecordingCountDownImplCopyWithImpl<_$RecordingCountDownImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendMessage,
    required TResult Function(String imagePath) sendImage,
    required TResult Function(String documentPath) sendDocument,
    required TResult Function() startRecording,
    required TResult Function(int secondsRemainin) recordingCountDown,
    required TResult Function() sendVoiceRecording,
    required TResult Function(String voicePath, int messageId) playVoiceMessage,
    required TResult Function(int messageId) pauseVoiceMessage,
  }) {
    return recordingCountDown(secondsRemainin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendMessage,
    TResult? Function(String imagePath)? sendImage,
    TResult? Function(String documentPath)? sendDocument,
    TResult? Function()? startRecording,
    TResult? Function(int secondsRemainin)? recordingCountDown,
    TResult? Function()? sendVoiceRecording,
    TResult? Function(String voicePath, int messageId)? playVoiceMessage,
    TResult? Function(int messageId)? pauseVoiceMessage,
  }) {
    return recordingCountDown?.call(secondsRemainin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendMessage,
    TResult Function(String imagePath)? sendImage,
    TResult Function(String documentPath)? sendDocument,
    TResult Function()? startRecording,
    TResult Function(int secondsRemainin)? recordingCountDown,
    TResult Function()? sendVoiceRecording,
    TResult Function(String voicePath, int messageId)? playVoiceMessage,
    TResult Function(int messageId)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (recordingCountDown != null) {
      return recordingCountDown(secondsRemainin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendDocument value) sendDocument,
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(RecordingCountDown value) recordingCountDown,
    required TResult Function(SendVoiceRecording value) sendVoiceRecording,
    required TResult Function(PlayVoiceMessage value) playVoiceMessage,
    required TResult Function(PauseVoiceMessage value) pauseVoiceMessage,
  }) {
    return recordingCountDown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendDocument value)? sendDocument,
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(RecordingCountDown value)? recordingCountDown,
    TResult? Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult? Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult? Function(PauseVoiceMessage value)? pauseVoiceMessage,
  }) {
    return recordingCountDown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendDocument value)? sendDocument,
    TResult Function(StartRecording value)? startRecording,
    TResult Function(RecordingCountDown value)? recordingCountDown,
    TResult Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult Function(PauseVoiceMessage value)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (recordingCountDown != null) {
      return recordingCountDown(this);
    }
    return orElse();
  }
}

abstract class RecordingCountDown implements ChatEvent {
  const factory RecordingCountDown(final int secondsRemainin) =
      _$RecordingCountDownImpl;

  int get secondsRemainin;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingCountDownImplCopyWith<_$RecordingCountDownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendVoiceRecordingImplCopyWith<$Res> {
  factory _$$SendVoiceRecordingImplCopyWith(_$SendVoiceRecordingImpl value,
          $Res Function(_$SendVoiceRecordingImpl) then) =
      __$$SendVoiceRecordingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendVoiceRecordingImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendVoiceRecordingImpl>
    implements _$$SendVoiceRecordingImplCopyWith<$Res> {
  __$$SendVoiceRecordingImplCopyWithImpl(_$SendVoiceRecordingImpl _value,
      $Res Function(_$SendVoiceRecordingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendVoiceRecordingImpl implements SendVoiceRecording {
  const _$SendVoiceRecordingImpl();

  @override
  String toString() {
    return 'ChatEvent.sendVoiceRecording()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendVoiceRecordingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendMessage,
    required TResult Function(String imagePath) sendImage,
    required TResult Function(String documentPath) sendDocument,
    required TResult Function() startRecording,
    required TResult Function(int secondsRemainin) recordingCountDown,
    required TResult Function() sendVoiceRecording,
    required TResult Function(String voicePath, int messageId) playVoiceMessage,
    required TResult Function(int messageId) pauseVoiceMessage,
  }) {
    return sendVoiceRecording();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendMessage,
    TResult? Function(String imagePath)? sendImage,
    TResult? Function(String documentPath)? sendDocument,
    TResult? Function()? startRecording,
    TResult? Function(int secondsRemainin)? recordingCountDown,
    TResult? Function()? sendVoiceRecording,
    TResult? Function(String voicePath, int messageId)? playVoiceMessage,
    TResult? Function(int messageId)? pauseVoiceMessage,
  }) {
    return sendVoiceRecording?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendMessage,
    TResult Function(String imagePath)? sendImage,
    TResult Function(String documentPath)? sendDocument,
    TResult Function()? startRecording,
    TResult Function(int secondsRemainin)? recordingCountDown,
    TResult Function()? sendVoiceRecording,
    TResult Function(String voicePath, int messageId)? playVoiceMessage,
    TResult Function(int messageId)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (sendVoiceRecording != null) {
      return sendVoiceRecording();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendDocument value) sendDocument,
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(RecordingCountDown value) recordingCountDown,
    required TResult Function(SendVoiceRecording value) sendVoiceRecording,
    required TResult Function(PlayVoiceMessage value) playVoiceMessage,
    required TResult Function(PauseVoiceMessage value) pauseVoiceMessage,
  }) {
    return sendVoiceRecording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendDocument value)? sendDocument,
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(RecordingCountDown value)? recordingCountDown,
    TResult? Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult? Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult? Function(PauseVoiceMessage value)? pauseVoiceMessage,
  }) {
    return sendVoiceRecording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendDocument value)? sendDocument,
    TResult Function(StartRecording value)? startRecording,
    TResult Function(RecordingCountDown value)? recordingCountDown,
    TResult Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult Function(PauseVoiceMessage value)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (sendVoiceRecording != null) {
      return sendVoiceRecording(this);
    }
    return orElse();
  }
}

abstract class SendVoiceRecording implements ChatEvent {
  const factory SendVoiceRecording() = _$SendVoiceRecordingImpl;
}

/// @nodoc
abstract class _$$PlayVoiceMessageImplCopyWith<$Res> {
  factory _$$PlayVoiceMessageImplCopyWith(_$PlayVoiceMessageImpl value,
          $Res Function(_$PlayVoiceMessageImpl) then) =
      __$$PlayVoiceMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String voicePath, int messageId});
}

/// @nodoc
class __$$PlayVoiceMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$PlayVoiceMessageImpl>
    implements _$$PlayVoiceMessageImplCopyWith<$Res> {
  __$$PlayVoiceMessageImplCopyWithImpl(_$PlayVoiceMessageImpl _value,
      $Res Function(_$PlayVoiceMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voicePath = null,
    Object? messageId = null,
  }) {
    return _then(_$PlayVoiceMessageImpl(
      null == voicePath
          ? _value.voicePath
          : voicePath // ignore: cast_nullable_to_non_nullable
              as String,
      null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PlayVoiceMessageImpl implements PlayVoiceMessage {
  const _$PlayVoiceMessageImpl(this.voicePath, this.messageId);

  @override
  final String voicePath;
  @override
  final int messageId;

  @override
  String toString() {
    return 'ChatEvent.playVoiceMessage(voicePath: $voicePath, messageId: $messageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayVoiceMessageImpl &&
            (identical(other.voicePath, voicePath) ||
                other.voicePath == voicePath) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, voicePath, messageId);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayVoiceMessageImplCopyWith<_$PlayVoiceMessageImpl> get copyWith =>
      __$$PlayVoiceMessageImplCopyWithImpl<_$PlayVoiceMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendMessage,
    required TResult Function(String imagePath) sendImage,
    required TResult Function(String documentPath) sendDocument,
    required TResult Function() startRecording,
    required TResult Function(int secondsRemainin) recordingCountDown,
    required TResult Function() sendVoiceRecording,
    required TResult Function(String voicePath, int messageId) playVoiceMessage,
    required TResult Function(int messageId) pauseVoiceMessage,
  }) {
    return playVoiceMessage(voicePath, messageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendMessage,
    TResult? Function(String imagePath)? sendImage,
    TResult? Function(String documentPath)? sendDocument,
    TResult? Function()? startRecording,
    TResult? Function(int secondsRemainin)? recordingCountDown,
    TResult? Function()? sendVoiceRecording,
    TResult? Function(String voicePath, int messageId)? playVoiceMessage,
    TResult? Function(int messageId)? pauseVoiceMessage,
  }) {
    return playVoiceMessage?.call(voicePath, messageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendMessage,
    TResult Function(String imagePath)? sendImage,
    TResult Function(String documentPath)? sendDocument,
    TResult Function()? startRecording,
    TResult Function(int secondsRemainin)? recordingCountDown,
    TResult Function()? sendVoiceRecording,
    TResult Function(String voicePath, int messageId)? playVoiceMessage,
    TResult Function(int messageId)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (playVoiceMessage != null) {
      return playVoiceMessage(voicePath, messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendDocument value) sendDocument,
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(RecordingCountDown value) recordingCountDown,
    required TResult Function(SendVoiceRecording value) sendVoiceRecording,
    required TResult Function(PlayVoiceMessage value) playVoiceMessage,
    required TResult Function(PauseVoiceMessage value) pauseVoiceMessage,
  }) {
    return playVoiceMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendDocument value)? sendDocument,
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(RecordingCountDown value)? recordingCountDown,
    TResult? Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult? Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult? Function(PauseVoiceMessage value)? pauseVoiceMessage,
  }) {
    return playVoiceMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendDocument value)? sendDocument,
    TResult Function(StartRecording value)? startRecording,
    TResult Function(RecordingCountDown value)? recordingCountDown,
    TResult Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult Function(PauseVoiceMessage value)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (playVoiceMessage != null) {
      return playVoiceMessage(this);
    }
    return orElse();
  }
}

abstract class PlayVoiceMessage implements ChatEvent {
  const factory PlayVoiceMessage(final String voicePath, final int messageId) =
      _$PlayVoiceMessageImpl;

  String get voicePath;
  int get messageId;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayVoiceMessageImplCopyWith<_$PlayVoiceMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PauseVoiceMessageImplCopyWith<$Res> {
  factory _$$PauseVoiceMessageImplCopyWith(_$PauseVoiceMessageImpl value,
          $Res Function(_$PauseVoiceMessageImpl) then) =
      __$$PauseVoiceMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int messageId});
}

/// @nodoc
class __$$PauseVoiceMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$PauseVoiceMessageImpl>
    implements _$$PauseVoiceMessageImplCopyWith<$Res> {
  __$$PauseVoiceMessageImplCopyWithImpl(_$PauseVoiceMessageImpl _value,
      $Res Function(_$PauseVoiceMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
  }) {
    return _then(_$PauseVoiceMessageImpl(
      null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PauseVoiceMessageImpl implements PauseVoiceMessage {
  const _$PauseVoiceMessageImpl(this.messageId);

  @override
  final int messageId;

  @override
  String toString() {
    return 'ChatEvent.pauseVoiceMessage(messageId: $messageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PauseVoiceMessageImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageId);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PauseVoiceMessageImplCopyWith<_$PauseVoiceMessageImpl> get copyWith =>
      __$$PauseVoiceMessageImplCopyWithImpl<_$PauseVoiceMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendMessage,
    required TResult Function(String imagePath) sendImage,
    required TResult Function(String documentPath) sendDocument,
    required TResult Function() startRecording,
    required TResult Function(int secondsRemainin) recordingCountDown,
    required TResult Function() sendVoiceRecording,
    required TResult Function(String voicePath, int messageId) playVoiceMessage,
    required TResult Function(int messageId) pauseVoiceMessage,
  }) {
    return pauseVoiceMessage(messageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendMessage,
    TResult? Function(String imagePath)? sendImage,
    TResult? Function(String documentPath)? sendDocument,
    TResult? Function()? startRecording,
    TResult? Function(int secondsRemainin)? recordingCountDown,
    TResult? Function()? sendVoiceRecording,
    TResult? Function(String voicePath, int messageId)? playVoiceMessage,
    TResult? Function(int messageId)? pauseVoiceMessage,
  }) {
    return pauseVoiceMessage?.call(messageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendMessage,
    TResult Function(String imagePath)? sendImage,
    TResult Function(String documentPath)? sendDocument,
    TResult Function()? startRecording,
    TResult Function(int secondsRemainin)? recordingCountDown,
    TResult Function()? sendVoiceRecording,
    TResult Function(String voicePath, int messageId)? playVoiceMessage,
    TResult Function(int messageId)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (pauseVoiceMessage != null) {
      return pauseVoiceMessage(messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendDocument value) sendDocument,
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(RecordingCountDown value) recordingCountDown,
    required TResult Function(SendVoiceRecording value) sendVoiceRecording,
    required TResult Function(PlayVoiceMessage value) playVoiceMessage,
    required TResult Function(PauseVoiceMessage value) pauseVoiceMessage,
  }) {
    return pauseVoiceMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendDocument value)? sendDocument,
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(RecordingCountDown value)? recordingCountDown,
    TResult? Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult? Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult? Function(PauseVoiceMessage value)? pauseVoiceMessage,
  }) {
    return pauseVoiceMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendDocument value)? sendDocument,
    TResult Function(StartRecording value)? startRecording,
    TResult Function(RecordingCountDown value)? recordingCountDown,
    TResult Function(SendVoiceRecording value)? sendVoiceRecording,
    TResult Function(PlayVoiceMessage value)? playVoiceMessage,
    TResult Function(PauseVoiceMessage value)? pauseVoiceMessage,
    required TResult orElse(),
  }) {
    if (pauseVoiceMessage != null) {
      return pauseVoiceMessage(this);
    }
    return orElse();
  }
}

abstract class PauseVoiceMessage implements ChatEvent {
  const factory PauseVoiceMessage(final int messageId) =
      _$PauseVoiceMessageImpl;

  int get messageId;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PauseVoiceMessageImplCopyWith<_$PauseVoiceMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
