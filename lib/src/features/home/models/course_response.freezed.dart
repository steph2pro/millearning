// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) {
  return _CourseResponse.fromJson(json);
}

/// @nodoc
mixin _$CourseResponse {
  List<Course> get courses => throw _privateConstructorUsedError;

  /// Serializes this CourseResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseResponseCopyWith<CourseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseResponseCopyWith<$Res> {
  factory $CourseResponseCopyWith(
          CourseResponse value, $Res Function(CourseResponse) then) =
      _$CourseResponseCopyWithImpl<$Res, CourseResponse>;
  @useResult
  $Res call({List<Course> courses});
}

/// @nodoc
class _$CourseResponseCopyWithImpl<$Res, $Val extends CourseResponse>
    implements $CourseResponseCopyWith<$Res> {
  _$CourseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
  }) {
    return _then(_value.copyWith(
      courses: null == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<Course>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseResponseImplCopyWith<$Res>
    implements $CourseResponseCopyWith<$Res> {
  factory _$$CourseResponseImplCopyWith(_$CourseResponseImpl value,
          $Res Function(_$CourseResponseImpl) then) =
      __$$CourseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Course> courses});
}

/// @nodoc
class __$$CourseResponseImplCopyWithImpl<$Res>
    extends _$CourseResponseCopyWithImpl<$Res, _$CourseResponseImpl>
    implements _$$CourseResponseImplCopyWith<$Res> {
  __$$CourseResponseImplCopyWithImpl(
      _$CourseResponseImpl _value, $Res Function(_$CourseResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
  }) {
    return _then(_$CourseResponseImpl(
      courses: null == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<Course>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseResponseImpl implements _CourseResponse {
  _$CourseResponseImpl({required final List<Course> courses})
      : _courses = courses;

  factory _$CourseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseResponseImplFromJson(json);

  final List<Course> _courses;
  @override
  List<Course> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  String toString() {
    return 'CourseResponse(courses: $courses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseResponseImpl &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courses));

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseResponseImplCopyWith<_$CourseResponseImpl> get copyWith =>
      __$$CourseResponseImplCopyWithImpl<_$CourseResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseResponseImplToJson(
      this,
    );
  }
}

abstract class _CourseResponse implements CourseResponse {
  factory _CourseResponse({required final List<Course> courses}) =
      _$CourseResponseImpl;

  factory _CourseResponse.fromJson(Map<String, dynamic> json) =
      _$CourseResponseImpl.fromJson;

  @override
  List<Course> get courses;

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseResponseImplCopyWith<_$CourseResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
