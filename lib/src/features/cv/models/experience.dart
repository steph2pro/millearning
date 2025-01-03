import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

@freezed
class Experience with _$Experience {

  factory Experience({
    required String poste,
    required String employeur,
    required String ville,
    required String dateDebut,
    required String dateFin,
    required String description,

  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) => _$ExperienceFromJson(json);
}