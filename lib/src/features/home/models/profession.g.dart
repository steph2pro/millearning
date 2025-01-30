// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profession.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfessionImpl _$$ProfessionImplFromJson(Map<String, dynamic> json) =>
    _$ProfessionImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      userId: (json['userId'] as num).toInt(),
      thumbnail: json['thumbnail'] as String,
      categoryId: (json['categoryId'] as num).toInt(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfessionImplToJson(_$ProfessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'thumbnail': instance.thumbnail,
      'categoryId': instance.categoryId,
      'user': instance.user.toJson(),
    };
