// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoImpl _$$VideoImplFromJson(Map<String, dynamic> json) => _$VideoImpl(
      id: (json['id'] as num).toInt(),
      professionId: (json['professionId'] as num).toInt(),
      title: json['title'] as String,
      youtubeId: json['youtubeId'] as String,
      thumbnail: json['thumbnail'] as String,
      professions: (json['professions'] as List<dynamic>)
          .map((e) => Profession.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VideoImplToJson(_$VideoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'professionId': instance.professionId,
      'title': instance.title,
      'youtubeId': instance.youtubeId,
      'thumbnail': instance.thumbnail,
      'professions': instance.professions.map((e) => e.toJson()).toList(),
    };
