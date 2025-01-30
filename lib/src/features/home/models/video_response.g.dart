// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoResponseImpl _$$VideoResponseImplFromJson(Map<String, dynamic> json) =>
    _$VideoResponseImpl(
      videos: (json['videos'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VideoResponseImplToJson(_$VideoResponseImpl instance) =>
    <String, dynamic>{
      'videos': instance.videos.map((e) => e.toJson()).toList(),
    };
