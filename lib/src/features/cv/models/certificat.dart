import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificat.freezed.dart';
part 'certificat.g.dart';

@freezed
class Certificats with _$Certificats {

  factory Certificats({
   
    required String  certificat,
    required String periode,
    required String description
  }) = _Certificats;

  factory Certificats.fromJson(Map<String, dynamic> json) => _$CertificatsFromJson(json);
}