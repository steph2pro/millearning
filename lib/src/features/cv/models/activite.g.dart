// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiviteImpl _$$ActiviteImplFromJson(Map<String, dynamic> json) =>
    _$ActiviteImpl(
      poste: json['poste'] as String,
      employeur: json['employeur'] as String,
      ville: json['ville'] as String,
      dateDebut: json['dateDebut'] as String,
      dateFin: json['dateFin'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ActiviteImplToJson(_$ActiviteImpl instance) =>
    <String, dynamic>{
      'poste': instance.poste,
      'employeur': instance.employeur,
      'ville': instance.ville,
      'dateDebut': instance.dateDebut,
      'dateFin': instance.dateFin,
      'description': instance.description,
    };
