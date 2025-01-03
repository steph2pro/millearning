import 'package:freezed_annotation/freezed_annotation.dart';

part 'competences.freezed.dart';
part 'competences.g.dart';

@freezed
class Competences with _$Competences {

  factory Competences({
    required String competence,
    required String niveau,
  }) = _Competences;

  factory Competences.fromJson(Map<String, dynamic> json) => _$CompetencesFromJson(json);
}