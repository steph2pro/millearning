part of 'course_cubit.dart';


@freezed
class CourseState with _$CourseState {
  factory CourseState.initial() = _Initial;

  factory CourseState.loading() = _Loading;

  factory CourseState.error({
    required ApiError error,
  }) = _Error;

  factory CourseState.successGetCourses({
    required CourseResponse response,
  }) = _SuccessGetCourses;
  
}
