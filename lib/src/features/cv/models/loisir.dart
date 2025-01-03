import 'package:freezed_annotation/freezed_annotation.dart';

part 'loisir.freezed.dart';
part 'loisir.g.dart';

@freezed
class Loisir with _$Loisir {

  factory Loisir({
    required String loisir,
  }) = _Loisir;

  factory Loisir.fromJson(Map<String, dynamic> json) => _$LoisirFromJson(json);
}