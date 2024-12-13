// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_password_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewPasswordRequest _$NewPasswordRequestFromJson(Map<String, dynamic> json) {
  return _NewPasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$NewPasswordRequest {
  String get phone => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;

  /// Serializes this NewPasswordRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewPasswordRequestCopyWith<NewPasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPasswordRequestCopyWith<$Res> {
  factory $NewPasswordRequestCopyWith(
          NewPasswordRequest value, $Res Function(NewPasswordRequest) then) =
      _$NewPasswordRequestCopyWithImpl<$Res, NewPasswordRequest>;
  @useResult
  $Res call({String phone, String newPassword, String accessToken});
}

/// @nodoc
class _$NewPasswordRequestCopyWithImpl<$Res, $Val extends NewPasswordRequest>
    implements $NewPasswordRequestCopyWith<$Res> {
  _$NewPasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? newPassword = null,
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewPasswordRequestImplCopyWith<$Res>
    implements $NewPasswordRequestCopyWith<$Res> {
  factory _$$NewPasswordRequestImplCopyWith(_$NewPasswordRequestImpl value,
          $Res Function(_$NewPasswordRequestImpl) then) =
      __$$NewPasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String newPassword, String accessToken});
}

/// @nodoc
class __$$NewPasswordRequestImplCopyWithImpl<$Res>
    extends _$NewPasswordRequestCopyWithImpl<$Res, _$NewPasswordRequestImpl>
    implements _$$NewPasswordRequestImplCopyWith<$Res> {
  __$$NewPasswordRequestImplCopyWithImpl(_$NewPasswordRequestImpl _value,
      $Res Function(_$NewPasswordRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? newPassword = null,
    Object? accessToken = null,
  }) {
    return _then(_$NewPasswordRequestImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewPasswordRequestImpl implements _NewPasswordRequest {
  _$NewPasswordRequestImpl(
      {required this.phone,
      required this.newPassword,
      required this.accessToken});

  factory _$NewPasswordRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewPasswordRequestImplFromJson(json);

  @override
  final String phone;
  @override
  final String newPassword;
  @override
  final String accessToken;

  @override
  String toString() {
    return 'NewPasswordRequest(phone: $phone, newPassword: $newPassword, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPasswordRequestImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phone, newPassword, accessToken);

  /// Create a copy of NewPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPasswordRequestImplCopyWith<_$NewPasswordRequestImpl> get copyWith =>
      __$$NewPasswordRequestImplCopyWithImpl<_$NewPasswordRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewPasswordRequestImplToJson(
      this,
    );
  }
}

abstract class _NewPasswordRequest implements NewPasswordRequest {
  factory _NewPasswordRequest(
      {required final String phone,
      required final String newPassword,
      required final String accessToken}) = _$NewPasswordRequestImpl;

  factory _NewPasswordRequest.fromJson(Map<String, dynamic> json) =
      _$NewPasswordRequestImpl.fromJson;

  @override
  String get phone;
  @override
  String get newPassword;
  @override
  String get accessToken;

  /// Create a copy of NewPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewPasswordRequestImplCopyWith<_$NewPasswordRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
