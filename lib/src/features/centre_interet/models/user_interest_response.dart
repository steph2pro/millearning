import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';

part 'user_interest_response.freezed.dart';
part 'user_interest_response.g.dart';

@freezed
class UserInterestResponse with _$UserInterestResponse {

  factory UserInterestResponse({
    required List<String> interests,
  }) = _UserInterestResponse;

  factory UserInterestResponse.fromJson(Map<String, dynamic> json) => _$UserInterestResponseFromJson(json);
}