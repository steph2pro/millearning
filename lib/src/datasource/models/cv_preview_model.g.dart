// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CvPreviewModelImpl _$$CvPreviewModelImplFromJson(Map<String, dynamic> json) =>
    _$CvPreviewModelImpl(
      id: (json['id'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CvPreviewModelImplToJson(
        _$CvPreviewModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'options': instance.options,
    };
