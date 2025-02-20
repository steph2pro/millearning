import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/course.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';

part 'userCourse.freezed.dart';
part 'userCourse.g.dart';

@freezed
class UserCourse with _$UserCourse {

  factory UserCourse({
    required int id,
    required int userId,
    required int courseId,
    @Default(0) int progress,
    @Default("en cours") String status,
    UserModel? user,
    Course? course,
  }) = _UserCourse;

  factory UserCourse.fromJson(Map<String, dynamic> json) => _$UserCourseFromJson(json);
}