// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_password_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewPasswordResponse _$NewPasswordResponseFromJson(Map<String, dynamic> json) {
  return _NewPasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$NewPasswordResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this NewPasswordResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewPasswordResponseCopyWith<NewPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPasswordResponseCopyWith<$Res> {
  factory $NewPasswordResponseCopyWith(
          NewPasswordResponse value, $Res Function(NewPasswordResponse) then) =
      _$NewPasswordResponseCopyWithImpl<$Res, NewPasswordResponse>;
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class _$NewPasswordResponseCopyWithImpl<$Res, $Val extends NewPasswordResponse>
    implements $NewPasswordResponseCopyWith<$Res> {
  _$NewPasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewPasswordResponseImplCopyWith<$Res>
    implements $NewPasswordResponseCopyWith<$Res> {
  factory _$$NewPasswordResponseImplCopyWith(_$NewPasswordResponseImpl value,
          $Res Function(_$NewPasswordResponseImpl) then) =
      __$$NewPasswordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class __$$NewPasswordResponseImplCopyWithImpl<$Res>
    extends _$NewPasswordResponseCopyWithImpl<$Res, _$NewPasswordResponseImpl>
    implements _$$NewPasswordResponseImplCopyWith<$Res> {
  __$$NewPasswordResponseImplCopyWithImpl(_$NewPasswordResponseImpl _value,
      $Res Function(_$NewPasswordResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_$NewPasswordResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewPasswordResponseImpl implements _NewPasswordResponse {
  _$NewPasswordResponseImpl({required this.success, required this.message});

  factory _$NewPasswordResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewPasswordResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;

  @override
  String toString() {
    return 'NewPasswordResponse(success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPasswordResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message);

  /// Create a copy of NewPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPasswordResponseImplCopyWith<_$NewPasswordResponseImpl> get copyWith =>
      __$$NewPasswordResponseImplCopyWithImpl<_$NewPasswordResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewPasswordResponseImplToJson(
      this,
    );
  }
}

abstract class _NewPasswordResponse implements NewPasswordResponse {
  factory _NewPasswordResponse(
      {required final bool success,
      required final String message}) = _$NewPasswordResponseImpl;

  factory _NewPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$NewPasswordResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;

  /// Create a copy of NewPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewPasswordResponseImplCopyWith<_$NewPasswordResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
