// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userCourse_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserCourseResponse _$UserCourseResponseFromJson(Map<String, dynamic> json) {
  return _UserCourseResponse.fromJson(json);
}

/// @nodoc
mixin _$UserCourseResponse {
  List<UserCourse> get userCourses => throw _privateConstructorUsedError;

  /// Serializes this UserCourseResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserCourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCourseResponseCopyWith<UserCourseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCourseResponseCopyWith<$Res> {
  factory $UserCourseResponseCopyWith(
          UserCourseResponse value, $Res Function(UserCourseResponse) then) =
      _$UserCourseResponseCopyWithImpl<$Res, UserCourseResponse>;
  @useResult
  $Res call({List<UserCourse> userCourses});
}

/// @nodoc
class _$UserCourseResponseCopyWithImpl<$Res, $Val extends UserCourseResponse>
    implements $UserCourseResponseCopyWith<$Res> {
  _$UserCourseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCourses = null,
  }) {
    return _then(_value.copyWith(
      userCourses: null == userCourses
          ? _value.userCourses
          : userCourses // ignore: cast_nullable_to_non_nullable
              as List<UserCourse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCourseResponseImplCopyWith<$Res>
    implements $UserCourseResponseCopyWith<$Res> {
  factory _$$UserCourseResponseImplCopyWith(_$UserCourseResponseImpl value,
          $Res Function(_$UserCourseResponseImpl) then) =
      __$$UserCourseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserCourse> userCourses});
}

/// @nodoc
class __$$UserCourseResponseImplCopyWithImpl<$Res>
    extends _$UserCourseResponseCopyWithImpl<$Res, _$UserCourseResponseImpl>
    implements _$$UserCourseResponseImplCopyWith<$Res> {
  __$$UserCourseResponseImplCopyWithImpl(_$UserCourseResponseImpl _value,
      $Res Function(_$UserCourseResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCourses = null,
  }) {
    return _then(_$UserCourseResponseImpl(
      userCourses: null == userCourses
          ? _value._userCourses
          : userCourses // ignore: cast_nullable_to_non_nullable
              as List<UserCourse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCourseResponseImpl implements _UserCourseResponse {
  _$UserCourseResponseImpl({required final List<UserCourse> userCourses})
      : _userCourses = userCourses;

  factory _$UserCourseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCourseResponseImplFromJson(json);

  final List<UserCourse> _userCourses;
  @override
  List<UserCourse> get userCourses {
    if (_userCourses is EqualUnmodifiableListView) return _userCourses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userCourses);
  }

  @override
  String toString() {
    return 'UserCourseResponse(userCourses: $userCourses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCourseResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._userCourses, _userCourses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userCourses));

  /// Create a copy of UserCourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCourseResponseImplCopyWith<_$UserCourseResponseImpl> get copyWith =>
      __$$UserCourseResponseImplCopyWithImpl<_$UserCourseResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCourseResponseImplToJson(
      this,
    );
  }
}

abstract class _UserCourseResponse implements UserCourseResponse {
  factory _UserCourseResponse({required final List<UserCourse> userCourses}) =
      _$UserCourseResponseImpl;

  factory _UserCourseResponse.fromJson(Map<String, dynamic> json) =
      _$UserCourseResponseImpl.fromJson;

  @override
  List<UserCourse> get userCourses;

  /// Create a copy of UserCourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCourseResponseImplCopyWith<_$UserCourseResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
