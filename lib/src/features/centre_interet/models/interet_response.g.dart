// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InteretResponseImpl _$$InteretResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$InteretResponseImpl(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$InteretResponseImplToJson(
        _$InteretResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data?.toJson(),
      'error': instance.error,
    };
