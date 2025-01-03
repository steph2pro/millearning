import 'package:freezed_annotation/freezed_annotation.dart';

part 'qualites.freezed.dart';
part 'qualites.g.dart';

@freezed
class Qualites with _$Qualites {

  factory Qualites({
    required String qualite,
  }) = _Qualites;

  factory Qualites.fromJson(Map<String, dynamic> json) => _$QualitesFromJson(json);
}