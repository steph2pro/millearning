// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseImpl _$$CourseImplFromJson(Map<String, dynamic> json) => _$CourseImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
      contenu: json['contenu'] as String,
      duration: (json['duration'] as num).toInt(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      students: (json['students'] as List<dynamic>?)
              ?.map((e) => UserCourse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CourseImplToJson(_$CourseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'contenu': instance.contenu,
      'duration': instance.duration,
      'user': instance.user.toJson(),
      'students': instance.students.map((e) => e.toJson()).toList(),
    };
