import 'package:freezed_annotation/freezed_annotation.dart';

part 'references.freezed.dart';
part 'references.g.dart';

@freezed
class References with _$References {

  factory References({
    required String nom,
    required String entreprise,
    required String ville,
    required String telephone,
    required String email,

  }) = _References;

  factory References.fromJson(Map<String, dynamic> json) => _$ReferencesFromJson(json);
}