// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userCourse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCourseImpl _$$UserCourseImplFromJson(Map<String, dynamic> json) =>
    _$UserCourseImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      courseId: (json['courseId'] as num).toInt(),
      progress: (json['progress'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? "en cours",
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserCourseImplToJson(_$UserCourseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'courseId': instance.courseId,
      'progress': instance.progress,
      'status': instance.status,
      'user': instance.user?.toJson(),
      'course': instance.course?.toJson(),
    };
