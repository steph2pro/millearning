// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interet_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InteretRequestImpl _$$InteretRequestImplFromJson(Map<String, dynamic> json) =>
    _$InteretRequestImpl(
      id: (json['id'] as num).toInt(),
      interests: (json['interests'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$InteretRequestImplToJson(
        _$InteretRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'interests': instance.interests,
    };
