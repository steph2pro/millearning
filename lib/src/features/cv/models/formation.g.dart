// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormationImpl _$$FormationImplFromJson(Map<String, dynamic> json) =>
    _$FormationImpl(
      titre: json['titre'] as String,
      etablissement: json['etablissement'] as String,
      ville: json['ville'] as String,
      dateDebut: json['dateDebut'] as String,
      dateFin: json['dateFin'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$FormationImplToJson(_$FormationImpl instance) =>
    <String, dynamic>{
      'titre': instance.titre,
      'etablissement': instance.etablissement,
      'ville': instance.ville,
      'dateDebut': instance.dateDebut,
      'dateFin': instance.dateFin,
      'description': instance.description,
    };
