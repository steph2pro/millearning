// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Certificats _$CertificatsFromJson(Map<String, dynamic> json) {
  return _Certificats.fromJson(json);
}

/// @nodoc
mixin _$Certificats {
  String get certificat => throw _privateConstructorUsedError;
  String get periode => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Certificats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Certificats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificatsCopyWith<Certificats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificatsCopyWith<$Res> {
  factory $CertificatsCopyWith(
          Certificats value, $Res Function(Certificats) then) =
      _$CertificatsCopyWithImpl<$Res, Certificats>;
  @useResult
  $Res call({String certificat, String periode, String description});
}

/// @nodoc
class _$CertificatsCopyWithImpl<$Res, $Val extends Certificats>
    implements $CertificatsCopyWith<$Res> {
  _$CertificatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Certificats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? certificat = null,
    Object? periode = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      certificat: null == certificat
          ? _value.certificat
          : certificat // ignore: cast_nullable_to_non_nullable
              as String,
      periode: null == periode
          ? _value.periode
          : periode // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CertificatsImplCopyWith<$Res>
    implements $CertificatsCopyWith<$Res> {
  factory _$$CertificatsImplCopyWith(
          _$CertificatsImpl value, $Res Function(_$CertificatsImpl) then) =
      __$$CertificatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String certificat, String periode, String description});
}

/// @nodoc
class __$$CertificatsImplCopyWithImpl<$Res>
    extends _$CertificatsCopyWithImpl<$Res, _$CertificatsImpl>
    implements _$$CertificatsImplCopyWith<$Res> {
  __$$CertificatsImplCopyWithImpl(
      _$CertificatsImpl _value, $Res Function(_$CertificatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Certificats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? certificat = null,
    Object? periode = null,
    Object? description = null,
  }) {
    return _then(_$CertificatsImpl(
      certificat: null == certificat
          ? _value.certificat
          : certificat // ignore: cast_nullable_to_non_nullable
              as String,
      periode: null == periode
          ? _value.periode
          : periode // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CertificatsImpl implements _Certificats {
  _$CertificatsImpl(
      {required this.certificat,
      required this.periode,
      required this.description});

  factory _$CertificatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CertificatsImplFromJson(json);

  @override
  final String certificat;
  @override
  final String periode;
  @override
  final String description;

  @override
  String toString() {
    return 'Certificats(certificat: $certificat, periode: $periode, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificatsImpl &&
            (identical(other.certificat, certificat) ||
                other.certificat == certificat) &&
            (identical(other.periode, periode) || other.periode == periode) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, certificat, periode, description);

  /// Create a copy of Certificats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificatsImplCopyWith<_$CertificatsImpl> get copyWith =>
      __$$CertificatsImplCopyWithImpl<_$CertificatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CertificatsImplToJson(
      this,
    );
  }
}

abstract class _Certificats implements Certificats {
  factory _Certificats(
      {required final String certificat,
      required final String periode,
      required final String description}) = _$CertificatsImpl;

  factory _Certificats.fromJson(Map<String, dynamic> json) =
      _$CertificatsImpl.fromJson;

  @override
  String get certificat;
  @override
  String get periode;
  @override
  String get description;

  /// Create a copy of Certificats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificatsImplCopyWith<_$CertificatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
