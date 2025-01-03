// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qualites.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Qualites _$QualitesFromJson(Map<String, dynamic> json) {
  return _Qualites.fromJson(json);
}

/// @nodoc
mixin _$Qualites {
  String get qualite => throw _privateConstructorUsedError;

  /// Serializes this Qualites to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Qualites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QualitesCopyWith<Qualites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QualitesCopyWith<$Res> {
  factory $QualitesCopyWith(Qualites value, $Res Function(Qualites) then) =
      _$QualitesCopyWithImpl<$Res, Qualites>;
  @useResult
  $Res call({String qualite});
}

/// @nodoc
class _$QualitesCopyWithImpl<$Res, $Val extends Qualites>
    implements $QualitesCopyWith<$Res> {
  _$QualitesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Qualites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qualite = null,
  }) {
    return _then(_value.copyWith(
      qualite: null == qualite
          ? _value.qualite
          : qualite // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QualitesImplCopyWith<$Res>
    implements $QualitesCopyWith<$Res> {
  factory _$$QualitesImplCopyWith(
          _$QualitesImpl value, $Res Function(_$QualitesImpl) then) =
      __$$QualitesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String qualite});
}

/// @nodoc
class __$$QualitesImplCopyWithImpl<$Res>
    extends _$QualitesCopyWithImpl<$Res, _$QualitesImpl>
    implements _$$QualitesImplCopyWith<$Res> {
  __$$QualitesImplCopyWithImpl(
      _$QualitesImpl _value, $Res Function(_$QualitesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Qualites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qualite = null,
  }) {
    return _then(_$QualitesImpl(
      qualite: null == qualite
          ? _value.qualite
          : qualite // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QualitesImpl implements _Qualites {
  _$QualitesImpl({required this.qualite});

  factory _$QualitesImpl.fromJson(Map<String, dynamic> json) =>
      _$$QualitesImplFromJson(json);

  @override
  final String qualite;

  @override
  String toString() {
    return 'Qualites(qualite: $qualite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QualitesImpl &&
            (identical(other.qualite, qualite) || other.qualite == qualite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, qualite);

  /// Create a copy of Qualites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QualitesImplCopyWith<_$QualitesImpl> get copyWith =>
      __$$QualitesImplCopyWithImpl<_$QualitesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QualitesImplToJson(
      this,
    );
  }
}

abstract class _Qualites implements Qualites {
  factory _Qualites({required final String qualite}) = _$QualitesImpl;

  factory _Qualites.fromJson(Map<String, dynamic> json) =
      _$QualitesImpl.fromJson;

  @override
  String get qualite;

  /// Create a copy of Qualites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QualitesImplCopyWith<_$QualitesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
