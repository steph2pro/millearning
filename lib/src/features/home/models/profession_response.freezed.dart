// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profession_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfessionResponse _$ProfessionResponseFromJson(Map<String, dynamic> json) {
  return _ProfessionResponse.fromJson(json);
}

/// @nodoc
mixin _$ProfessionResponse {
// String? message,
  List<Profession> get professions => throw _privateConstructorUsedError;

  /// Serializes this ProfessionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfessionResponseCopyWith<ProfessionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfessionResponseCopyWith<$Res> {
  factory $ProfessionResponseCopyWith(
          ProfessionResponse value, $Res Function(ProfessionResponse) then) =
      _$ProfessionResponseCopyWithImpl<$Res, ProfessionResponse>;
  @useResult
  $Res call({List<Profession> professions});
}

/// @nodoc
class _$ProfessionResponseCopyWithImpl<$Res, $Val extends ProfessionResponse>
    implements $ProfessionResponseCopyWith<$Res> {
  _$ProfessionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? professions = null,
  }) {
    return _then(_value.copyWith(
      professions: null == professions
          ? _value.professions
          : professions // ignore: cast_nullable_to_non_nullable
              as List<Profession>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfessionResponseImplCopyWith<$Res>
    implements $ProfessionResponseCopyWith<$Res> {
  factory _$$ProfessionResponseImplCopyWith(_$ProfessionResponseImpl value,
          $Res Function(_$ProfessionResponseImpl) then) =
      __$$ProfessionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Profession> professions});
}

/// @nodoc
class __$$ProfessionResponseImplCopyWithImpl<$Res>
    extends _$ProfessionResponseCopyWithImpl<$Res, _$ProfessionResponseImpl>
    implements _$$ProfessionResponseImplCopyWith<$Res> {
  __$$ProfessionResponseImplCopyWithImpl(_$ProfessionResponseImpl _value,
      $Res Function(_$ProfessionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? professions = null,
  }) {
    return _then(_$ProfessionResponseImpl(
      professions: null == professions
          ? _value._professions
          : professions // ignore: cast_nullable_to_non_nullable
              as List<Profession>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfessionResponseImpl implements _ProfessionResponse {
  const _$ProfessionResponseImpl({required final List<Profession> professions})
      : _professions = professions;

  factory _$ProfessionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfessionResponseImplFromJson(json);

// String? message,
  final List<Profession> _professions;
// String? message,
  @override
  List<Profession> get professions {
    if (_professions is EqualUnmodifiableListView) return _professions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_professions);
  }

  @override
  String toString() {
    return 'ProfessionResponse(professions: $professions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfessionResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._professions, _professions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_professions));

  /// Create a copy of ProfessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfessionResponseImplCopyWith<_$ProfessionResponseImpl> get copyWith =>
      __$$ProfessionResponseImplCopyWithImpl<_$ProfessionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfessionResponseImplToJson(
      this,
    );
  }
}

abstract class _ProfessionResponse implements ProfessionResponse {
  const factory _ProfessionResponse(
      {required final List<Profession> professions}) = _$ProfessionResponseImpl;

  factory _ProfessionResponse.fromJson(Map<String, dynamic> json) =
      _$ProfessionResponseImpl.fromJson;

// String? message,
  @override
  List<Profession> get professions;

  /// Create a copy of ProfessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfessionResponseImplCopyWith<_$ProfessionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
