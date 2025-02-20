import 'package:freezed_annotation/freezed_annotation.dart';

part 'interet_request.freezed.dart';
part 'interet_request.g.dart';

@freezed
class InteretRequest with _$InteretRequest {

  factory InteretRequest({
    required int id,
    required List<int> interests,
  }) = _InteretRequest;

  factory InteretRequest.fromJson(Map<String, dynamic> json) => _$InteretRequestFromJson(json);
}