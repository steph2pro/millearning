// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Activite _$ActiviteFromJson(Map<String, dynamic> json) {
  return _Activite.fromJson(json);
}

/// @nodoc
mixin _$Activite {
  String get poste => throw _privateConstructorUsedError;
  String get employeur => throw _privateConstructorUsedError;
  String get ville => throw _privateConstructorUsedError;
  String get dateDebut => throw _privateConstructorUsedError;
  String get dateFin => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Activite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Activite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiviteCopyWith<Activite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiviteCopyWith<$Res> {
  factory $ActiviteCopyWith(Activite value, $Res Function(Activite) then) =
      _$ActiviteCopyWithImpl<$Res, Activite>;
  @useResult
  $Res call(
      {String poste,
      String employeur,
      String ville,
      String dateDebut,
      String dateFin,
      String description});
}

/// @nodoc
class _$ActiviteCopyWithImpl<$Res, $Val extends Activite>
    implements $ActiviteCopyWith<$Res> {
  _$ActiviteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Activite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poste = null,
    Object? employeur = null,
    Object? ville = null,
    Object? dateDebut = null,
    Object? dateFin = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      poste: null == poste
          ? _value.poste
          : poste // ignore: cast_nullable_to_non_nullable
              as String,
      employeur: null == employeur
          ? _value.employeur
          : employeur // ignore: cast_nullable_to_non_nullable
              as String,
      ville: null == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String,
      dateDebut: null == dateDebut
          ? _value.dateDebut
          : dateDebut // ignore: cast_nullable_to_non_nullable
              as String,
      dateFin: null == dateFin
          ? _value.dateFin
          : dateFin // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiviteImplCopyWith<$Res>
    implements $ActiviteCopyWith<$Res> {
  factory _$$ActiviteImplCopyWith(
          _$ActiviteImpl value, $Res Function(_$ActiviteImpl) then) =
      __$$ActiviteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String poste,
      String employeur,
      String ville,
      String dateDebut,
      String dateFin,
      String description});
}

/// @nodoc
class __$$ActiviteImplCopyWithImpl<$Res>
    extends _$ActiviteCopyWithImpl<$Res, _$ActiviteImpl>
    implements _$$ActiviteImplCopyWith<$Res> {
  __$$ActiviteImplCopyWithImpl(
      _$ActiviteImpl _value, $Res Function(_$ActiviteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Activite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poste = null,
    Object? employeur = null,
    Object? ville = null,
    Object? dateDebut = null,
    Object? dateFin = null,
    Object? description = null,
  }) {
    return _then(_$ActiviteImpl(
      poste: null == poste
          ? _value.poste
          : poste // ignore: cast_nullable_to_non_nullable
              as String,
      employeur: null == employeur
          ? _value.employeur
          : employeur // ignore: cast_nullable_to_non_nullable
              as String,
      ville: null == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String,
      dateDebut: null == dateDebut
          ? _value.dateDebut
          : dateDebut // ignore: cast_nullable_to_non_nullable
              as String,
      dateFin: null == dateFin
          ? _value.dateFin
          : dateFin // ignore: cast_nullable_to_non_nullable
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
class _$ActiviteImpl implements _Activite {
  _$ActiviteImpl(
      {required this.poste,
      required this.employeur,
      required this.ville,
      required this.dateDebut,
      required this.dateFin,
      required this.description});

  factory _$ActiviteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiviteImplFromJson(json);

  @override
  final String poste;
  @override
  final String employeur;
  @override
  final String ville;
  @override
  final String dateDebut;
  @override
  final String dateFin;
  @override
  final String description;

  @override
  String toString() {
    return 'Activite(poste: $poste, employeur: $employeur, ville: $ville, dateDebut: $dateDebut, dateFin: $dateFin, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiviteImpl &&
            (identical(other.poste, poste) || other.poste == poste) &&
            (identical(other.employeur, employeur) ||
                other.employeur == employeur) &&
            (identical(other.ville, ville) || other.ville == ville) &&
            (identical(other.dateDebut, dateDebut) ||
                other.dateDebut == dateDebut) &&
            (identical(other.dateFin, dateFin) || other.dateFin == dateFin) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, poste, employeur, ville, dateDebut, dateFin, description);

  /// Create a copy of Activite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiviteImplCopyWith<_$ActiviteImpl> get copyWith =>
      __$$ActiviteImplCopyWithImpl<_$ActiviteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiviteImplToJson(
      this,
    );
  }
}

abstract class _Activite implements Activite {
  factory _Activite(
      {required final String poste,
      required final String employeur,
      required final String ville,
      required final String dateDebut,
      required final String dateFin,
      required final String description}) = _$ActiviteImpl;

  factory _Activite.fromJson(Map<String, dynamic> json) =
      _$ActiviteImpl.fromJson;

  @override
  String get poste;
  @override
  String get employeur;
  @override
  String get ville;
  @override
  String get dateDebut;
  @override
  String get dateFin;
  @override
  String get description;

  /// Create a copy of Activite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiviteImplCopyWith<_$ActiviteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
