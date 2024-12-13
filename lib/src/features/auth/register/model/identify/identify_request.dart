import 'package:freezed_annotation/freezed_annotation.dart';

part 'identify_request.freezed.dart';
part 'identify_request.g.dart';

@freezed
class IdentifyRequest with _$IdentifyRequest {

  factory IdentifyRequest(
  {
    required String? email,
    required String? phone,
  }
  ) = _IdentifyRequest;

  factory IdentifyRequest.fromJson(Map<String, dynamic> json) => _$IdentifyRequestFromJson(json);
}