// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interet_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InteretResponse _$InteretResponseFromJson(Map<String, dynamic> json) {
  return _InteretResponse.fromJson(json);
}

/// @nodoc
mixin _$InteretResponse {
  String get message => throw _privateConstructorUsedError;
  UserModel? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this InteretResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InteretResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InteretResponseCopyWith<InteretResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteretResponseCopyWith<$Res> {
  factory $InteretResponseCopyWith(
          InteretResponse value, $Res Function(InteretResponse) then) =
      _$InteretResponseCopyWithImpl<$Res, InteretResponse>;
  @useResult
  $Res call({String message, UserModel? data, String? error});

  $UserModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$InteretResponseCopyWithImpl<$Res, $Val extends InteretResponse>
    implements $InteretResponseCopyWith<$Res> {
  _$InteretResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InteretResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of InteretResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InteretResponseImplCopyWith<$Res>
    implements $InteretResponseCopyWith<$Res> {
  factory _$$InteretResponseImplCopyWith(_$InteretResponseImpl value,
          $Res Function(_$InteretResponseImpl) then) =
      __$$InteretResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, UserModel? data, String? error});

  @override
  $UserModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$InteretResponseImplCopyWithImpl<$Res>
    extends _$InteretResponseCopyWithImpl<$Res, _$InteretResponseImpl>
    implements _$$InteretResponseImplCopyWith<$Res> {
  __$$InteretResponseImplCopyWithImpl(
      _$InteretResponseImpl _value, $Res Function(_$InteretResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of InteretResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$InteretResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InteretResponseImpl implements _InteretResponse {
  _$InteretResponseImpl({required this.message, this.data, this.error});

  factory _$InteretResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$InteretResponseImplFromJson(json);

  @override
  final String message;
  @override
  final UserModel? data;
  @override
  final String? error;

  @override
  String toString() {
    return 'InteretResponse(message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteretResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data, error);

  /// Create a copy of InteretResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InteretResponseImplCopyWith<_$InteretResponseImpl> get copyWith =>
      __$$InteretResponseImplCopyWithImpl<_$InteretResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InteretResponseImplToJson(
      this,
    );
  }
}

abstract class _InteretResponse implements InteretResponse {
  factory _InteretResponse(
      {required final String message,
      final UserModel? data,
      final String? error}) = _$InteretResponseImpl;

  factory _InteretResponse.fromJson(Map<String, dynamic> json) =
      _$InteretResponseImpl.fromJson;

  @override
  String get message;
  @override
  UserModel? get data;
  @override
  String? get error;

  /// Create a copy of InteretResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InteretResponseImplCopyWith<_$InteretResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
