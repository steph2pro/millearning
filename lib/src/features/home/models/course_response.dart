import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/course.dart';

part 'course_response.freezed.dart';
part 'course_response.g.dart';

@freezed
class CourseResponse with _$CourseResponse {

  factory CourseResponse({
    required List<Course> courses
  }) = _CourseResponse;

  factory CourseResponse.fromJson(Map<String, dynamic> json) => _$CourseResponseFromJson(json);
}