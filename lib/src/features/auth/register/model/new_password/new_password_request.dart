import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_password_request.freezed.dart';
part 'new_password_request.g.dart';

@freezed
class NewPasswordRequest with _$NewPasswordRequest {

  factory NewPasswordRequest({
    required String phone ,
    required String newPassword ,
    required String  accessToken,
  }) = _NewPasswordRequest;

  factory NewPasswordRequest.fromJson(Map<String, dynamic> json) => _$NewPasswordRequestFromJson(json);
}