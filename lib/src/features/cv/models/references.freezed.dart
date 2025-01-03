// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'references.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

References _$ReferencesFromJson(Map<String, dynamic> json) {
  return _References.fromJson(json);
}

/// @nodoc
mixin _$References {
  String get nom => throw _privateConstructorUsedError;
  String get entreprise => throw _privateConstructorUsedError;
  String get ville => throw _privateConstructorUsedError;
  String get telephone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this References to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of References
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferencesCopyWith<References> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferencesCopyWith<$Res> {
  factory $ReferencesCopyWith(
          References value, $Res Function(References) then) =
      _$ReferencesCopyWithImpl<$Res, References>;
  @useResult
  $Res call(
      {String nom,
      String entreprise,
      String ville,
      String telephone,
      String email});
}

/// @nodoc
class _$ReferencesCopyWithImpl<$Res, $Val extends References>
    implements $ReferencesCopyWith<$Res> {
  _$ReferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of References
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nom = null,
    Object? entreprise = null,
    Object? ville = null,
    Object? telephone = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      entreprise: null == entreprise
          ? _value.entreprise
          : entreprise // ignore: cast_nullable_to_non_nullable
              as String,
      ville: null == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferencesImplCopyWith<$Res>
    implements $ReferencesCopyWith<$Res> {
  factory _$$ReferencesImplCopyWith(
          _$ReferencesImpl value, $Res Function(_$ReferencesImpl) then) =
      __$$ReferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nom,
      String entreprise,
      String ville,
      String telephone,
      String email});
}

/// @nodoc
class __$$ReferencesImplCopyWithImpl<$Res>
    extends _$ReferencesCopyWithImpl<$Res, _$ReferencesImpl>
    implements _$$ReferencesImplCopyWith<$Res> {
  __$$ReferencesImplCopyWithImpl(
      _$ReferencesImpl _value, $Res Function(_$ReferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of References
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nom = null,
    Object? entreprise = null,
    Object? ville = null,
    Object? telephone = null,
    Object? email = null,
  }) {
    return _then(_$ReferencesImpl(
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      entreprise: null == entreprise
          ? _value.entreprise
          : entreprise // ignore: cast_nullable_to_non_nullable
              as String,
      ville: null == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferencesImpl implements _References {
  _$ReferencesImpl(
      {required this.nom,
      required this.entreprise,
      required this.ville,
      required this.telephone,
      required this.email});

  factory _$ReferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferencesImplFromJson(json);

  @override
  final String nom;
  @override
  final String entreprise;
  @override
  final String ville;
  @override
  final String telephone;
  @override
  final String email;

  @override
  String toString() {
    return 'References(nom: $nom, entreprise: $entreprise, ville: $ville, telephone: $telephone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferencesImpl &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.entreprise, entreprise) ||
                other.entreprise == entreprise) &&
            (identical(other.ville, ville) || other.ville == ville) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nom, entreprise, ville, telephone, email);

  /// Create a copy of References
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferencesImplCopyWith<_$ReferencesImpl> get copyWith =>
      __$$ReferencesImplCopyWithImpl<_$ReferencesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferencesImplToJson(
      this,
    );
  }
}

abstract class _References implements References {
  factory _References(
      {required final String nom,
      required final String entreprise,
      required final String ville,
      required final String telephone,
      required final String email}) = _$ReferencesImpl;

  factory _References.fromJson(Map<String, dynamic> json) =
      _$ReferencesImpl.fromJson;

  @override
  String get nom;
  @override
  String get entreprise;
  @override
  String get ville;
  @override
  String get telephone;
  @override
  String get email;

  /// Create a copy of References
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferencesImplCopyWith<_$ReferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
