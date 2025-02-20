// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userCourse_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCourseResponseImpl _$$UserCourseResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserCourseResponseImpl(
      userCourses: (json['userCourses'] as List<dynamic>)
          .map((e) => UserCourse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserCourseResponseImplToJson(
        _$UserCourseResponseImpl instance) =>
    <String, dynamic>{
      'userCourses': instance.userCourses.map((e) => e.toJson()).toList(),
    };
