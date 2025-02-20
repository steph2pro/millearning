import 'package:freezed_annotation/freezed_annotation.dart';

part 'userCourse_request.freezed.dart';
part 'userCourse_request.g.dart';

@freezed
class UserCourseRequest with _$UserCourseRequest {

  factory UserCourseRequest({
    required int userId,
    required int courseId,
    
  }) = _UserCourseRequest;

  factory UserCourseRequest.fromJson(Map<String, dynamic> json) => _$UserCourseRequestFromJson(json);
}