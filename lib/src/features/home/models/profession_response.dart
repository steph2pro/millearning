import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/features/home/models/profession.dart';

part 'profession_response.freezed.dart';
part 'profession_response.g.dart';

@freezed
class ProfessionResponse with _$ProfessionResponse {
  const factory ProfessionResponse({
    required List<Profession> professions,
  }) = _ProfessionResponse;

  factory ProfessionResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfessionResponseFromJson(json);
}
