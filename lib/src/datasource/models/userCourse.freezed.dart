// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userCourse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserCourse _$UserCourseFromJson(Map<String, dynamic> json) {
  return _UserCourse.fromJson(json);
}

/// @nodoc
mixin _$UserCourse {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get courseId => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  Course? get course => throw _privateConstructorUsedError;

  /// Serializes this UserCourse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserCourse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCourseCopyWith<UserCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCourseCopyWith<$Res> {
  factory $UserCourseCopyWith(
          UserCourse value, $Res Function(UserCourse) then) =
      _$UserCourseCopyWithImpl<$Res, UserCourse>;
  @useResult
  $Res call(
      {int id,
      int userId,
      int courseId,
      int progress,
      String status,
      UserModel? user,
      Course? course});

  $UserModelCopyWith<$Res>? get user;
  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class _$UserCourseCopyWithImpl<$Res, $Val extends UserCourse>
    implements $UserCourseCopyWith<$Res> {
  _$UserCourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCourse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? courseId = null,
    Object? progress = null,
    Object? status = null,
    Object? user = freezed,
    Object? course = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
    ) as $Val);
  }

  /// Create a copy of UserCourse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of UserCourse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserCourseImplCopyWith<$Res>
    implements $UserCourseCopyWith<$Res> {
  factory _$$UserCourseImplCopyWith(
          _$UserCourseImpl value, $Res Function(_$UserCourseImpl) then) =
      __$$UserCourseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      int courseId,
      int progress,
      String status,
      UserModel? user,
      Course? course});

  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class __$$UserCourseImplCopyWithImpl<$Res>
    extends _$UserCourseCopyWithImpl<$Res, _$UserCourseImpl>
    implements _$$UserCourseImplCopyWith<$Res> {
  __$$UserCourseImplCopyWithImpl(
      _$UserCourseImpl _value, $Res Function(_$UserCourseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCourse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? courseId = null,
    Object? progress = null,
    Object? status = null,
    Object? user = freezed,
    Object? course = freezed,
  }) {
    return _then(_$UserCourseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCourseImpl implements _UserCourse {
  _$UserCourseImpl(
      {required this.id,
      required this.userId,
      required this.courseId,
      this.progress = 0,
      this.status = "en cours",
      this.user,
      this.course});

  factory _$UserCourseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCourseImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int courseId;
  @override
  @JsonKey()
  final int progress;
  @override
  @JsonKey()
  final String status;
  @override
  final UserModel? user;
  @override
  final Course? course;

  @override
  String toString() {
    return 'UserCourse(id: $id, userId: $userId, courseId: $courseId, progress: $progress, status: $status, user: $user, course: $course)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCourseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.course, course) || other.course == course));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, courseId, progress, status, user, course);

  /// Create a copy of UserCourse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCourseImplCopyWith<_$UserCourseImpl> get copyWith =>
      __$$UserCourseImplCopyWithImpl<_$UserCourseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCourseImplToJson(
      this,
    );
  }
}

abstract class _UserCourse implements UserCourse {
  factory _UserCourse(
      {required final int id,
      required final int userId,
      required final int courseId,
      final int progress,
      final String status,
      final UserModel? user,
      final Course? course}) = _$UserCourseImpl;

  factory _UserCourse.fromJson(Map<String, dynamic> json) =
      _$UserCourseImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  int get courseId;
  @override
  int get progress;
  @override
  String get status;
  @override
  UserModel? get user;
  @override
  Course? get course;

  /// Create a copy of UserCourse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCourseImplCopyWith<_$UserCourseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
