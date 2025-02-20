// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      profil: json['profil'] as String?,
      accessToken: json['accessToken'] as String?,
      role: json['role'] as String,
      status: json['status'] as String,
      interests: (json['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      courses: (json['courses'] as List<dynamic>?)
              ?.map((e) => UserCourse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'profil': instance.profil,
      'accessToken': instance.accessToken,
      'role': instance.role,
      'status': instance.status,
      'interests': instance.interests,
      'courses': instance.courses.map((e) => e.toJson()).toList(),
    };
