import 'package:freezed_annotation/freezed_annotation.dart';

part 'formation.freezed.dart';
part 'formation.g.dart';

@freezed
class Formation with _$Formation {

  factory Formation({
    required String titre,
    required String etablissement,
    required String ville,
    required String dateDebut,
    required String dateFin,
    required String description,
  }) = _Formation;

  factory Formation.fromJson(Map<String, dynamic> json) => _$FormationFromJson(json);
}