// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StageImpl _$$StageImplFromJson(Map<String, dynamic> json) => _$StageImpl(
      poste: json['poste'] as String,
      employeur: json['employeur'] as String,
      ville: json['ville'] as String,
      dateDebut: json['dateDebut'] as String,
      dateFin: json['dateFin'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$StageImplToJson(_$StageImpl instance) =>
    <String, dynamic>{
      'poste': instance.poste,
      'employeur': instance.employeur,
      'ville': instance.ville,
      'dateDebut': instance.dateDebut,
      'dateFin': instance.dateFin,
      'description': instance.description,
    };
