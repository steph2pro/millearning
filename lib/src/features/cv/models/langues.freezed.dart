// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'langues.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Langues _$LanguesFromJson(Map<String, dynamic> json) {
  return _Langues.fromJson(json);
}

/// @nodoc
mixin _$Langues {
  String get langue => throw _privateConstructorUsedError;
  String get niveau => throw _privateConstructorUsedError;

  /// Serializes this Langues to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Langues
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LanguesCopyWith<Langues> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguesCopyWith<$Res> {
  factory $LanguesCopyWith(Langues value, $Res Function(Langues) then) =
      _$LanguesCopyWithImpl<$Res, Langues>;
  @useResult
  $Res call({String langue, String niveau});
}

/// @nodoc
class _$LanguesCopyWithImpl<$Res, $Val extends Langues>
    implements $LanguesCopyWith<$Res> {
  _$LanguesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Langues
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? langue = null,
    Object? niveau = null,
  }) {
    return _then(_value.copyWith(
      langue: null == langue
          ? _value.langue
          : langue // ignore: cast_nullable_to_non_nullable
              as String,
      niveau: null == niveau
          ? _value.niveau
          : niveau // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguesImplCopyWith<$Res> implements $LanguesCopyWith<$Res> {
  factory _$$LanguesImplCopyWith(
          _$LanguesImpl value, $Res Function(_$LanguesImpl) then) =
      __$$LanguesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String langue, String niveau});
}

/// @nodoc
class __$$LanguesImplCopyWithImpl<$Res>
    extends _$LanguesCopyWithImpl<$Res, _$LanguesImpl>
    implements _$$LanguesImplCopyWith<$Res> {
  __$$LanguesImplCopyWithImpl(
      _$LanguesImpl _value, $Res Function(_$LanguesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Langues
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? langue = null,
    Object? niveau = null,
  }) {
    return _then(_$LanguesImpl(
      langue: null == langue
          ? _value.langue
          : langue // ignore: cast_nullable_to_non_nullable
              as String,
      niveau: null == niveau
          ? _value.niveau
          : niveau // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguesImpl implements _Langues {
  _$LanguesImpl({required this.langue, required this.niveau});

  factory _$LanguesImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguesImplFromJson(json);

  @override
  final String langue;
  @override
  final String niveau;

  @override
  String toString() {
    return 'Langues(langue: $langue, niveau: $niveau)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguesImpl &&
            (identical(other.langue, langue) || other.langue == langue) &&
            (identical(other.niveau, niveau) || other.niveau == niveau));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, langue, niveau);

  /// Create a copy of Langues
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguesImplCopyWith<_$LanguesImpl> get copyWith =>
      __$$LanguesImplCopyWithImpl<_$LanguesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguesImplToJson(
      this,
    );
  }
}

abstract class _Langues implements Langues {
  factory _Langues(
      {required final String langue,
      required final String niveau}) = _$LanguesImpl;

  factory _Langues.fromJson(Map<String, dynamic> json) = _$LanguesImpl.fromJson;

  @override
  String get langue;
  @override
  String get niveau;

  /// Create a copy of Langues
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LanguesImplCopyWith<_$LanguesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
