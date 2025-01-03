// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realisations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Realisations _$RealisationsFromJson(Map<String, dynamic> json) {
  return _Realisations.fromJson(json);
}

/// @nodoc
mixin _$Realisations {
  String get realisation => throw _privateConstructorUsedError;

  /// Serializes this Realisations to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Realisations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RealisationsCopyWith<Realisations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealisationsCopyWith<$Res> {
  factory $RealisationsCopyWith(
          Realisations value, $Res Function(Realisations) then) =
      _$RealisationsCopyWithImpl<$Res, Realisations>;
  @useResult
  $Res call({String realisation});
}

/// @nodoc
class _$RealisationsCopyWithImpl<$Res, $Val extends Realisations>
    implements $RealisationsCopyWith<$Res> {
  _$RealisationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Realisations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? realisation = null,
  }) {
    return _then(_value.copyWith(
      realisation: null == realisation
          ? _value.realisation
          : realisation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RealisationsImplCopyWith<$Res>
    implements $RealisationsCopyWith<$Res> {
  factory _$$RealisationsImplCopyWith(
          _$RealisationsImpl value, $Res Function(_$RealisationsImpl) then) =
      __$$RealisationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String realisation});
}

/// @nodoc
class __$$RealisationsImplCopyWithImpl<$Res>
    extends _$RealisationsCopyWithImpl<$Res, _$RealisationsImpl>
    implements _$$RealisationsImplCopyWith<$Res> {
  __$$RealisationsImplCopyWithImpl(
      _$RealisationsImpl _value, $Res Function(_$RealisationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Realisations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? realisation = null,
  }) {
    return _then(_$RealisationsImpl(
      realisation: null == realisation
          ? _value.realisation
          : realisation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealisationsImpl implements _Realisations {
  _$RealisationsImpl({required this.realisation});

  factory _$RealisationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RealisationsImplFromJson(json);

  @override
  final String realisation;

  @override
  String toString() {
    return 'Realisations(realisation: $realisation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealisationsImpl &&
            (identical(other.realisation, realisation) ||
                other.realisation == realisation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, realisation);

  /// Create a copy of Realisations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealisationsImplCopyWith<_$RealisationsImpl> get copyWith =>
      __$$RealisationsImplCopyWithImpl<_$RealisationsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RealisationsImplToJson(
      this,
    );
  }
}

abstract class _Realisations implements Realisations {
  factory _Realisations({required final String realisation}) =
      _$RealisationsImpl;

  factory _Realisations.fromJson(Map<String, dynamic> json) =
      _$RealisationsImpl.fromJson;

  @override
  String get realisation;

  /// Create a copy of Realisations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealisationsImplCopyWith<_$RealisationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
