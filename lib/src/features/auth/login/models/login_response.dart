import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {

  factory LoginResponse({
    required String message,
    required UserModel data
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}