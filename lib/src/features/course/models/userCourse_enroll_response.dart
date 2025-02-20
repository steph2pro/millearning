import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/userCourse.dart';

part 'userCourse_enroll_response.freezed.dart';
part 'userCourse_enroll_response.g.dart';

@freezed
class UserCourseEnrollResponse with _$UserCourseEnrollResponse {

  factory UserCourseEnrollResponse({
    required String message,
    required UserCourse data,
  }) = _UserCourseEnrollResponse;

  factory UserCourseEnrollResponse.fromJson(Map<String, dynamic> json) => _$UserCourseEnrollResponseFromJson(json);
}