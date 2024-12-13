// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdentifyResponseImpl _$$IdentifyResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$IdentifyResponseImpl(
      message: json['message'] as String,
      email: json['email'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$IdentifyResponseImplToJson(
        _$IdentifyResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'email': instance.email,
      'id': instance.id,
    };
