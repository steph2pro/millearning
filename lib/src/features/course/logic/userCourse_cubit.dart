

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/course_repository.dart';
import 'package:millearnia/src/features/course/models/userCourse_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'userCourse_cubit.freezed.dart';

part 'userCourse_state.dart';
class UserCourseCubit extends Cubit<UserCourseState> {
  final CourseRepository _courseRepository;

  UserCourseCubit({
    CourseRepository? courseRepository,
  })  : _courseRepository = courseRepository ?? locator<CourseRepository>(),
        super(UserCourseState.initial());
  // recuperer les Course 
  Future<void> getUserCours( int userId) async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(UserCourseState.loading());

    final response = await _courseRepository.userCourses(userId);
    print('Cubit UserCourse ${response}');
    response.when(
      success: (data) => emit(UserCourseState.successUserCourse( response: data)),
      error: (error) => emit(UserCourseState.error(error: error)),
    );
  }
}