import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {

  factory UserResponse({
    required List <UserModel> mentors
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
}