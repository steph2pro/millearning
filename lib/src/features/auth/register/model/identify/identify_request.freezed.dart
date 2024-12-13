// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identify_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IdentifyRequest _$IdentifyRequestFromJson(Map<String, dynamic> json) {
  return _IdentifyRequest.fromJson(json);
}

/// @nodoc
mixin _$IdentifyRequest {
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  /// Serializes this IdentifyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IdentifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdentifyRequestCopyWith<IdentifyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentifyRequestCopyWith<$Res> {
  factory $IdentifyRequestCopyWith(
          IdentifyRequest value, $Res Function(IdentifyRequest) then) =
      _$IdentifyRequestCopyWithImpl<$Res, IdentifyRequest>;
  @useResult
  $Res call({String? email, String? phone});
}

/// @nodoc
class _$IdentifyRequestCopyWithImpl<$Res, $Val extends IdentifyRequest>
    implements $IdentifyRequestCopyWith<$Res> {
  _$IdentifyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IdentifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdentifyRequestImplCopyWith<$Res>
    implements $IdentifyRequestCopyWith<$Res> {
  factory _$$IdentifyRequestImplCopyWith(_$IdentifyRequestImpl value,
          $Res Function(_$IdentifyRequestImpl) then) =
      __$$IdentifyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? phone});
}

/// @nodoc
class __$$IdentifyRequestImplCopyWithImpl<$Res>
    extends _$IdentifyRequestCopyWithImpl<$Res, _$IdentifyRequestImpl>
    implements _$$IdentifyRequestImplCopyWith<$Res> {
  __$$IdentifyRequestImplCopyWithImpl(
      _$IdentifyRequestImpl _value, $Res Function(_$IdentifyRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of IdentifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$IdentifyRequestImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentifyRequestImpl implements _IdentifyRequest {
  _$IdentifyRequestImpl({required this.email, required this.phone});

  factory _$IdentifyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentifyRequestImplFromJson(json);

  @override
  final String? email;
  @override
  final String? phone;

  @override
  String toString() {
    return 'IdentifyRequest(email: $email, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentifyRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, phone);

  /// Create a copy of IdentifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentifyRequestImplCopyWith<_$IdentifyRequestImpl> get copyWith =>
      __$$IdentifyRequestImplCopyWithImpl<_$IdentifyRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentifyRequestImplToJson(
      this,
    );
  }
}

abstract class _IdentifyRequest implements IdentifyRequest {
  factory _IdentifyRequest(
      {required final String? email,
      required final String? phone}) = _$IdentifyRequestImpl;

  factory _IdentifyRequest.fromJson(Map<String, dynamic> json) =
      _$IdentifyRequestImpl.fromJson;

  @override
  String? get email;
  @override
  String? get phone;

  /// Create a copy of IdentifyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdentifyRequestImplCopyWith<_$IdentifyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
