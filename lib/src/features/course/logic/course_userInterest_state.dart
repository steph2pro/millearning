part of 'course_userInterest_cubit.dart';


@freezed
class CourseUserInterestState with _$CourseUserInterestState {
  factory CourseUserInterestState.initial() = _Initial;

  factory CourseUserInterestState.loading() = _Loading;

  factory CourseUserInterestState.error({
    required ApiError error,
  }) = _Error;

  factory CourseUserInterestState.successGetCourseUserInterests({
    required CourseResponse response,
  }) = _SuccessGetCourseUserInterests;
  
}
