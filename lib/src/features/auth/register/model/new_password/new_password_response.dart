import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_password_response.freezed.dart';
part 'new_password_response.g.dart';

@freezed
class NewPasswordResponse with _$NewPasswordResponse {

  factory NewPasswordResponse({

    required bool success ,
    required String message ,
  }) = _NewPasswordResponse;

  factory NewPasswordResponse.fromJson(Map<String, dynamic> json) => _$NewPasswordResponseFromJson(json);
}