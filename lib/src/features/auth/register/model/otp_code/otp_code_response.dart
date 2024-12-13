import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_code_response.freezed.dart';
part 'otp_code_response.g.dart';

@freezed
class OtpCodeResponse with _$OtpCodeResponse {

  factory OtpCodeResponse({
    required bool success ,
    required String message ,
    required String email ,
    required String phone ,
    required String accessToken ,
  }) = _OtpCodeResponse;

  factory OtpCodeResponse.fromJson(Map<String, dynamic> json) => _$OtpCodeResponseFromJson(json);
}