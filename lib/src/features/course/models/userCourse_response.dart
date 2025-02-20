import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/userCourse.dart';

part 'userCourse_response.freezed.dart';
part 'userCourse_response.g.dart';

@freezed
class UserCourseResponse with _$UserCourseResponse {

  factory UserCourseResponse({
    required List<UserCourse> userCourses
  }) = _UserCourseResponse;

  factory UserCourseResponse.fromJson(Map<String, dynamic> json) => _$UserCourseResponseFromJson(json);
}