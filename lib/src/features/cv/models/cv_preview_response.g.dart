// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CvPreviewResponseImpl _$$CvPreviewResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CvPreviewResponseImpl(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CvPreviewModel.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$CvPreviewResponseImplToJson(
        _$CvPreviewResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data?.toJson(),
      'error': instance.error,
    };
