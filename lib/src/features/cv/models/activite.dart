import 'package:freezed_annotation/freezed_annotation.dart';

part 'activite.freezed.dart';
part 'activite.g.dart';

@freezed
class Activite with _$Activite {

  factory Activite({
    required String poste,
    required String employeur,
    required String ville,
    required String dateDebut,
    required String dateFin,
    required String description,
  }) = _Activite;

  factory Activite.fromJson(Map<String, dynamic> json) => _$ActiviteFromJson(json);
}