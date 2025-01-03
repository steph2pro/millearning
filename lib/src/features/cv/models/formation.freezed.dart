// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Formation _$FormationFromJson(Map<String, dynamic> json) {
  return _Formation.fromJson(json);
}

/// @nodoc
mixin _$Formation {
  String get titre => throw _privateConstructorUsedError;
  String get etablissement => throw _privateConstructorUsedError;
  String get ville => throw _privateConstructorUsedError;
  String get dateDebut => throw _privateConstructorUsedError;
  String get dateFin => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Formation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Formation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormationCopyWith<Formation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormationCopyWith<$Res> {
  factory $FormationCopyWith(Formation value, $Res Function(Formation) then) =
      _$FormationCopyWithImpl<$Res, Formation>;
  @useResult
  $Res call(
      {String titre,
      String etablissement,
      String ville,
      String dateDebut,
      String dateFin,
      String description});
}

/// @nodoc
class _$FormationCopyWithImpl<$Res, $Val extends Formation>
    implements $FormationCopyWith<$Res> {
  _$FormationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Formation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titre = null,
    Object? etablissement = null,
    Object? ville = null,
    Object? dateDebut = null,
    Object? dateFin = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      titre: null == titre
          ? _value.titre
          : titre // ignore: cast_nullable_to_non_nullable
              as String,
      etablissement: null == etablissement
          ? _value.etablissement
          : etablissement // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FormationImplCopyWith<$Res>
    implements $FormationCopyWith<$Res> {
  factory _$$FormationImplCopyWith(
          _$FormationImpl value, $Res Function(_$FormationImpl) then) =
      __$$FormationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String titre,
      String etablissement,
      String ville,
      String dateDebut,
      String dateFin,
      String description});
}

/// @nodoc
class __$$FormationImplCopyWithImpl<$Res>
    extends _$FormationCopyWithImpl<$Res, _$FormationImpl>
    implements _$$FormationImplCopyWith<$Res> {
  __$$FormationImplCopyWithImpl(
      _$FormationImpl _value, $Res Function(_$FormationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Formation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titre = null,
    Object? etablissement = null,
    Object? ville = null,
    Object? dateDebut = null,
    Object? dateFin = null,
    Object? description = null,
  }) {
    return _then(_$FormationImpl(
      titre: null == titre
          ? _value.titre
          : titre // ignore: cast_nullable_to_non_nullable
              as String,
      etablissement: null == etablissement
          ? _value.etablissement
          : etablissement // ignore: cast_nullable_to_non_nullable
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
class _$FormationImpl implements _Formation {
  _$FormationImpl(
      {required this.titre,
      required this.etablissement,
      required this.ville,
      required this.dateDebut,
      required this.dateFin,
      required this.description});

  factory _$FormationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormationImplFromJson(json);

  @override
  final String titre;
  @override
  final String etablissement;
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
    return 'Formation(titre: $titre, etablissement: $etablissement, ville: $ville, dateDebut: $dateDebut, dateFin: $dateFin, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormationImpl &&
            (identical(other.titre, titre) || other.titre == titre) &&
            (identical(other.etablissement, etablissement) ||
                other.etablissement == etablissement) &&
            (identical(other.ville, ville) || other.ville == ville) &&
            (identical(other.dateDebut, dateDebut) ||
                other.dateDebut == dateDebut) &&
            (identical(other.dateFin, dateFin) || other.dateFin == dateFin) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, titre, etablissement, ville,
      dateDebut, dateFin, description);

  /// Create a copy of Formation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormationImplCopyWith<_$FormationImpl> get copyWith =>
      __$$FormationImplCopyWithImpl<_$FormationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormationImplToJson(
      this,
    );
  }
}

abstract class _Formation implements Formation {
  factory _Formation(
      {required final String titre,
      required final String etablissement,
      required final String ville,
      required final String dateDebut,
      required final String dateFin,
      required final String description}) = _$FormationImpl;

  factory _Formation.fromJson(Map<String, dynamic> json) =
      _$FormationImpl.fromJson;

  @override
  String get titre;
  @override
  String get etablissement;
  @override
  String get ville;
  @override
  String get dateDebut;
  @override
  String get dateFin;
  @override
  String get description;

  /// Create a copy of Formation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormationImplCopyWith<_$FormationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
