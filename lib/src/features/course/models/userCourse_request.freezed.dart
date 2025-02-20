// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userCourse_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserCourseRequest _$UserCourseRequestFromJson(Map<String, dynamic> json) {
  return _UserCourseRequest.fromJson(json);
}

/// @nodoc
mixin _$UserCourseRequest {
  int get userId => throw _privateConstructorUsedError;
  int get courseId => throw _privateConstructorUsedError;

  /// Serializes this UserCourseRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserCourseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCourseRequestCopyWith<UserCourseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCourseRequestCopyWith<$Res> {
  factory $UserCourseRequestCopyWith(
          UserCourseRequest value, $Res Function(UserCourseRequest) then) =
      _$UserCourseRequestCopyWithImpl<$Res, UserCourseRequest>;
  @useResult
  $Res call({int userId, int courseId});
}

/// @nodoc
class _$UserCourseRequestCopyWithImpl<$Res, $Val extends UserCourseRequest>
    implements $UserCourseRequestCopyWith<$Res> {
  _$UserCourseRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCourseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? courseId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCourseRequestImplCopyWith<$Res>
    implements $UserCourseRequestCopyWith<$Res> {
  factory _$$UserCourseRequestImplCopyWith(_$UserCourseRequestImpl value,
          $Res Function(_$UserCourseRequestImpl) then) =
      __$$UserCourseRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int courseId});
}

/// @nodoc
class __$$UserCourseRequestImplCopyWithImpl<$Res>
    extends _$UserCourseRequestCopyWithImpl<$Res, _$UserCourseRequestImpl>
    implements _$$UserCourseRequestImplCopyWith<$Res> {
  __$$UserCourseRequestImplCopyWithImpl(_$UserCourseRequestImpl _value,
      $Res Function(_$UserCourseRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCourseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? courseId = null,
  }) {
    return _then(_$UserCourseRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCourseRequestImpl implements _UserCourseRequest {
  _$UserCourseRequestImpl({required this.userId, required this.courseId});

  factory _$UserCourseRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCourseRequestImplFromJson(json);

  @override
  final int userId;
  @override
  final int courseId;

  @override
  String toString() {
    return 'UserCourseRequest(userId: $userId, courseId: $courseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCourseRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, courseId);

  /// Create a copy of UserCourseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCourseRequestImplCopyWith<_$UserCourseRequestImpl> get copyWith =>
      __$$UserCourseRequestImplCopyWithImpl<_$UserCourseRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCourseRequestImplToJson(
      this,
    );
  }
}

abstract class _UserCourseRequest implements UserCourseRequest {
  factory _UserCourseRequest(
      {required final int userId,
      required final int courseId}) = _$UserCourseRequestImpl;

  factory _UserCourseRequest.fromJson(Map<String, dynamic> json) =
      _$UserCourseRequestImpl.fromJson;

  @override
  int get userId;
  @override
  int get courseId;

  /// Create a copy of UserCourseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCourseRequestImplCopyWith<_$UserCourseRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
