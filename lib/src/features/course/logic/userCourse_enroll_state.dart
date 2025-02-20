part of 'userCourse_enroll_cubit.dart';


@freezed
class UserCourseEnrollState with _$UserCourseEnrollState {
  factory UserCourseEnrollState.initial() = _Initial;

  factory UserCourseEnrollState.loading() = _Loading;

  factory UserCourseEnrollState.error({
    required ApiError error,
  }) = _Error;

  factory UserCourseEnrollState.successUserCourseEnroll({
    required UserCourseEnrollResponse response,
  }) = _SuccessUserCourseEnroll;
}