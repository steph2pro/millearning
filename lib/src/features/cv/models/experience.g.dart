// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperienceImpl _$$ExperienceImplFromJson(Map<String, dynamic> json) =>
    _$ExperienceImpl(
      poste: json['poste'] as String,
      employeur: json['employeur'] as String,
      ville: json['ville'] as String,
      dateDebut: json['dateDebut'] as String,
      dateFin: json['dateFin'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ExperienceImplToJson(_$ExperienceImpl instance) =>
    <String, dynamic>{
      'poste': instance.poste,
      'employeur': instance.employeur,
      'ville': instance.ville,
      'dateDebut': instance.dateDebut,
      'dateFin': instance.dateFin,
      'description': instance.description,
    };
