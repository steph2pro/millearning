// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identify_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IdentifyResponse _$IdentifyResponseFromJson(Map<String, dynamic> json) {
  return _IdentifyResponse.fromJson(json);
}

/// @nodoc
mixin _$IdentifyResponse {
  String get message => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this IdentifyResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IdentifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdentifyResponseCopyWith<IdentifyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentifyResponseCopyWith<$Res> {
  factory $IdentifyResponseCopyWith(
          IdentifyResponse value, $Res Function(IdentifyResponse) then) =
      _$IdentifyResponseCopyWithImpl<$Res, IdentifyResponse>;
  @useResult
  $Res call({String message, String? email, String? id});
}

/// @nodoc
class _$IdentifyResponseCopyWithImpl<$Res, $Val extends IdentifyResponse>
    implements $IdentifyResponseCopyWith<$Res> {
  _$IdentifyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IdentifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? email = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdentifyResponseImplCopyWith<$Res>
    implements $IdentifyResponseCopyWith<$Res> {
  factory _$$IdentifyResponseImplCopyWith(_$IdentifyResponseImpl value,
          $Res Function(_$IdentifyResponseImpl) then) =
      __$$IdentifyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? email, String? id});
}

/// @nodoc
class __$$IdentifyResponseImplCopyWithImpl<$Res>
    extends _$IdentifyResponseCopyWithImpl<$Res, _$IdentifyResponseImpl>
    implements _$$IdentifyResponseImplCopyWith<$Res> {
  __$$IdentifyResponseImplCopyWithImpl(_$IdentifyResponseImpl _value,
      $Res Function(_$IdentifyResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of IdentifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? email = freezed,
    Object? id = freezed,
  }) {
    return _then(_$IdentifyResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentifyResponseImpl implements _IdentifyResponse {
  _$IdentifyResponseImpl({required this.message, this.email, this.id});

  factory _$IdentifyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentifyResponseImplFromJson(json);

  @override
  final String message;
  @override
  final String? email;
  @override
  final String? id;

  @override
  String toString() {
    return 'IdentifyResponse(message: $message, email: $email, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentifyResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, email, id);

  /// Create a copy of IdentifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentifyResponseImplCopyWith<_$IdentifyResponseImpl> get copyWith =>
      __$$IdentifyResponseImplCopyWithImpl<_$IdentifyResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentifyResponseImplToJson(
      this,
    );
  }
}

abstract class _IdentifyResponse implements IdentifyResponse {
  factory _IdentifyResponse(
      {required final String message,
      final String? email,
      final String? id}) = _$IdentifyResponseImpl;

  factory _IdentifyResponse.fromJson(Map<String, dynamic> json) =
      _$IdentifyResponseImpl.fromJson;

  @override
  String get message;
  @override
  String? get email;
  @override
  String? get id;

  /// Create a copy of IdentifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdentifyResponseImplCopyWith<_$IdentifyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
