import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/userCourse.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {

  factory Course({
     required int id,
    required String title,
    required  String description,
    required  String thumbnail,
    required String contenu,
    required int duration,
    required UserModel user,
    // required String createdAt,
    // required String updatedAt,

    @Default([]) List<UserCourse> students,
    
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}