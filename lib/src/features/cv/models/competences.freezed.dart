// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Competences _$CompetencesFromJson(Map<String, dynamic> json) {
  return _Competences.fromJson(json);
}

/// @nodoc
mixin _$Competences {
  String get competence => throw _privateConstructorUsedError;
  String get niveau => throw _privateConstructorUsedError;

  /// Serializes this Competences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Competences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompetencesCopyWith<Competences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompetencesCopyWith<$Res> {
  factory $CompetencesCopyWith(
          Competences value, $Res Function(Competences) then) =
      _$CompetencesCopyWithImpl<$Res, Competences>;
  @useResult
  $Res call({String competence, String niveau});
}

/// @nodoc
class _$CompetencesCopyWithImpl<$Res, $Val extends Competences>
    implements $CompetencesCopyWith<$Res> {
  _$CompetencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Competences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? competence = null,
    Object? niveau = null,
  }) {
    return _then(_value.copyWith(
      competence: null == competence
          ? _value.competence
          : competence // ignore: cast_nullable_to_non_nullable
              as String,
      niveau: null == niveau
          ? _value.niveau
          : niveau // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompetencesImplCopyWith<$Res>
    implements $CompetencesCopyWith<$Res> {
  factory _$$CompetencesImplCopyWith(
          _$CompetencesImpl value, $Res Function(_$CompetencesImpl) then) =
      __$$CompetencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String competence, String niveau});
}

/// @nodoc
class __$$CompetencesImplCopyWithImpl<$Res>
    extends _$CompetencesCopyWithImpl<$Res, _$CompetencesImpl>
    implements _$$CompetencesImplCopyWith<$Res> {
  __$$CompetencesImplCopyWithImpl(
      _$CompetencesImpl _value, $Res Function(_$CompetencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Competences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? competence = null,
    Object? niveau = null,
  }) {
    return _then(_$CompetencesImpl(
      competence: null == competence
          ? _value.competence
          : competence // ignore: cast_nullable_to_non_nullable
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
class _$CompetencesImpl implements _Competences {
  _$CompetencesImpl({required this.competence, required this.niveau});

  factory _$CompetencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompetencesImplFromJson(json);

  @override
  final String competence;
  @override
  final String niveau;

  @override
  String toString() {
    return 'Competences(competence: $competence, niveau: $niveau)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompetencesImpl &&
            (identical(other.competence, competence) ||
                other.competence == competence) &&
            (identical(other.niveau, niveau) || other.niveau == niveau));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, competence, niveau);

  /// Create a copy of Competences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompetencesImplCopyWith<_$CompetencesImpl> get copyWith =>
      __$$CompetencesImplCopyWithImpl<_$CompetencesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompetencesImplToJson(
      this,
    );
  }
}

abstract class _Competences implements Competences {
  factory _Competences(
      {required final String competence,
      required final String niveau}) = _$CompetencesImpl;

  factory _Competences.fromJson(Map<String, dynamic> json) =
      _$CompetencesImpl.fromJson;

  @override
  String get competence;
  @override
  String get niveau;

  /// Create a copy of Competences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompetencesImplCopyWith<_$CompetencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
