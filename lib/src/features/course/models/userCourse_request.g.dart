// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userCourse_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCourseRequestImpl _$$UserCourseRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UserCourseRequestImpl(
      userId: (json['userId'] as num).toInt(),
      courseId: (json['courseId'] as num).toInt(),
    );

Map<String, dynamic> _$$UserCourseRequestImplToJson(
        _$UserCourseRequestImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'courseId': instance.courseId,
    };
