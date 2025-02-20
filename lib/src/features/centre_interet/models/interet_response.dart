import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';

part 'interet_response.freezed.dart';
part 'interet_response.g.dart';

@freezed
class InteretResponse with _$InteretResponse {

  factory InteretResponse({ 
    required String message,
    UserModel? data,
    String? error
    }) = _InteretResponse;

  factory InteretResponse.fromJson(Map<String, dynamic> json) => _$InteretResponseFromJson(json);
}