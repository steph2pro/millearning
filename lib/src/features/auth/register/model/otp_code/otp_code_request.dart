import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_code_request.freezed.dart';
part 'otp_code_request.g.dart';

@freezed
class OtpCodeRequest with _$OtpCodeRequest {

  factory OtpCodeRequest({
    required String otpCode,
  }) = _OtpCodeRequest;

  factory OtpCodeRequest.fromJson(Map<String, dynamic> json) => _$OtpCodeRequestFromJson(json);
}