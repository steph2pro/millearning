import 'package:freezed_annotation/freezed_annotation.dart';

part 'identify_response.freezed.dart';
part 'identify_response.g.dart';

@freezed
class IdentifyResponse with _$IdentifyResponse {

  factory IdentifyResponse({
    required String message,
     String? email,
     String? phone,
     String? id,

  }) = _IdentifyResponse;

  factory IdentifyResponse.fromJson(Map<String, dynamic> json) => _$IdentifyResponseFromJson(json);
}