// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loisir.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Loisir _$LoisirFromJson(Map<String, dynamic> json) {
  return _Loisir.fromJson(json);
}

/// @nodoc
mixin _$Loisir {
  String get loisir => throw _privateConstructorUsedError;

  /// Serializes this Loisir to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Loisir
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoisirCopyWith<Loisir> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoisirCopyWith<$Res> {
  factory $LoisirCopyWith(Loisir value, $Res Function(Loisir) then) =
      _$LoisirCopyWithImpl<$Res, Loisir>;
  @useResult
  $Res call({String loisir});
}

/// @nodoc
class _$LoisirCopyWithImpl<$Res, $Val extends Loisir>
    implements $LoisirCopyWith<$Res> {
  _$LoisirCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Loisir
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loisir = null,
  }) {
    return _then(_value.copyWith(
      loisir: null == loisir
          ? _value.loisir
          : loisir // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoisirImplCopyWith<$Res> implements $LoisirCopyWith<$Res> {
  factory _$$LoisirImplCopyWith(
          _$LoisirImpl value, $Res Function(_$LoisirImpl) then) =
      __$$LoisirImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String loisir});
}

/// @nodoc
class __$$LoisirImplCopyWithImpl<$Res>
    extends _$LoisirCopyWithImpl<$Res, _$LoisirImpl>
    implements _$$LoisirImplCopyWith<$Res> {
  __$$LoisirImplCopyWithImpl(
      _$LoisirImpl _value, $Res Function(_$LoisirImpl) _then)
      : super(_value, _then);

  /// Create a copy of Loisir
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loisir = null,
  }) {
    return _then(_$LoisirImpl(
      loisir: null == loisir
          ? _value.loisir
          : loisir // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoisirImpl implements _Loisir {
  _$LoisirImpl({required this.loisir});

  factory _$LoisirImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoisirImplFromJson(json);

  @override
  final String loisir;

  @override
  String toString() {
    return 'Loisir(loisir: $loisir)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoisirImpl &&
            (identical(other.loisir, loisir) || other.loisir == loisir));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, loisir);

  /// Create a copy of Loisir
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoisirImplCopyWith<_$LoisirImpl> get copyWith =>
      __$$LoisirImplCopyWithImpl<_$LoisirImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoisirImplToJson(
      this,
    );
  }
}

abstract class _Loisir implements Loisir {
  factory _Loisir({required final String loisir}) = _$LoisirImpl;

  factory _Loisir.fromJson(Map<String, dynamic> json) = _$LoisirImpl.fromJson;

  @override
  String get loisir;

  /// Create a copy of Loisir
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoisirImplCopyWith<_$LoisirImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
