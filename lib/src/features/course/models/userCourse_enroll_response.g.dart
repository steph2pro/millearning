// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userCourse_enroll_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCourseEnrollResponseImpl _$$UserCourseEnrollResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserCourseEnrollResponseImpl(
      message: json['message'] as String,
      data: UserCourse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserCourseEnrollResponseImplToJson(
        _$UserCourseEnrollResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };
