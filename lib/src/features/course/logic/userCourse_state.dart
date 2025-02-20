part of 'userCourse_cubit.dart';


@freezed
class UserCourseState with _$UserCourseState {
  factory UserCourseState.initial() = _Initial;

  factory UserCourseState.loading() = _Loading;

  factory UserCourseState.error({
    required ApiError error,
  }) = _Error;

  factory UserCourseState.successUserCourse({
    required UserCourseResponse response,
  }) = _SuccessUserCourse;
}