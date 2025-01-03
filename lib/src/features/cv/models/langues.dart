import 'package:freezed_annotation/freezed_annotation.dart';

part 'langues.freezed.dart';
part 'langues.g.dart';

@freezed
class Langues with _$Langues {

  factory Langues({
    required String langue,
    required String niveau,
  }) = _Langues;

  factory Langues.fromJson(Map<String, dynamic> json) => _$LanguesFromJson(json);
}