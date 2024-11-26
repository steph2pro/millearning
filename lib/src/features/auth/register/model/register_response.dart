import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
class RegisterResponse with _$RegisterResponse {

  factory RegisterResponse({ 
    required String message,
    UserModel? data,
    String? error
    }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
}