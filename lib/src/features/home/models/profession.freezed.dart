// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profession.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profession _$ProfessionFromJson(Map<String, dynamic> json) {
  return _Profession.fromJson(json);
}

/// @nodoc
mixin _$Profession {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get thumbnail =>
      throw _privateConstructorUsedError; // required List<String> tabs,
  int get categoryId =>
      throw _privateConstructorUsedError; // required Category category,
  UserModel get user => throw _privateConstructorUsedError;

  /// Serializes this Profession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfessionCopyWith<Profession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfessionCopyWith<$Res> {
  factory $ProfessionCopyWith(
          Profession value, $Res Function(Profession) then) =
      _$ProfessionCopyWithImpl<$Res, Profession>;
  @useResult
  $Res call(
      {int id,
      String name,
      int userId,
      String thumbnail,
      int categoryId,
      UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$ProfessionCopyWithImpl<$Res, $Val extends Profession>
    implements $ProfessionCopyWith<$Res> {
  _$ProfessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userId = null,
    Object? thumbnail = null,
    Object? categoryId = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }

  /// Create a copy of Profession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfessionImplCopyWith<$Res>
    implements $ProfessionCopyWith<$Res> {
  factory _$$ProfessionImplCopyWith(
          _$ProfessionImpl value, $Res Function(_$ProfessionImpl) then) =
      __$$ProfessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int userId,
      String thumbnail,
      int categoryId,
      UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$ProfessionImplCopyWithImpl<$Res>
    extends _$ProfessionCopyWithImpl<$Res, _$ProfessionImpl>
    implements _$$ProfessionImplCopyWith<$Res> {
  __$$ProfessionImplCopyWithImpl(
      _$ProfessionImpl _value, $Res Function(_$ProfessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Profession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userId = null,
    Object? thumbnail = null,
    Object? categoryId = null,
    Object? user = null,
  }) {
    return _then(_$ProfessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfessionImpl implements _Profession {
  const _$ProfessionImpl(
      {required this.id,
      required this.name,
      required this.userId,
      required this.thumbnail,
      required this.categoryId,
      required this.user});

  factory _$ProfessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfessionImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int userId;
  @override
  final String thumbnail;
// required List<String> tabs,
  @override
  final int categoryId;
// required Category category,
  @override
  final UserModel user;

  @override
  String toString() {
    return 'Profession(id: $id, name: $name, userId: $userId, thumbnail: $thumbnail, categoryId: $categoryId, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, userId, thumbnail, categoryId, user);

  /// Create a copy of Profession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfessionImplCopyWith<_$ProfessionImpl> get copyWith =>
      __$$ProfessionImplCopyWithImpl<_$ProfessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfessionImplToJson(
      this,
    );
  }
}

abstract class _Profession implements Profession {
  const factory _Profession(
      {required final int id,
      required final String name,
      required final int userId,
      required final String thumbnail,
      required final int categoryId,
      required final UserModel user}) = _$ProfessionImpl;

  factory _Profession.fromJson(Map<String, dynamic> json) =
      _$ProfessionImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get userId;
  @override
  String get thumbnail; // required List<String> tabs,
  @override
  int get categoryId; // required Category category,
  @override
  UserModel get user;

  /// Create a copy of Profession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfessionImplCopyWith<_$ProfessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
