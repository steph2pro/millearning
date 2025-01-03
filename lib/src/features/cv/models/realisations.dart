import 'package:freezed_annotation/freezed_annotation.dart';

part 'realisations.freezed.dart';
part 'realisations.g.dart';

@freezed
class Realisations with _$Realisations {

  factory Realisations({
    required String realisation,
  }) = _Realisations;

  factory Realisations.fromJson(Map<String, dynamic> json) => _$RealisationsFromJson(json);
}