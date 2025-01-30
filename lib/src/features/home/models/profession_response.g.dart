// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profession_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfessionResponseImpl _$$ProfessionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfessionResponseImpl(
      professions: (json['professions'] as List<dynamic>)
          .map((e) => Profession.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProfessionResponseImplToJson(
        _$ProfessionResponseImpl instance) =>
    <String, dynamic>{
      'professions': instance.professions.map((e) => e.toJson()).toList(),
    };
