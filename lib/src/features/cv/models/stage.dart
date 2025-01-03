import 'package:freezed_annotation/freezed_annotation.dart';

part 'stage.freezed.dart';
part 'stage.g.dart';

@freezed
class Stage with _$Stage {

  factory Stage({
    required String poste,
    required String employeur,
    required String ville,
    required String dateDebut,
    required String dateFin,
    required String description,

  }) = _Stage;

  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);
}