

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/course_repository.dart';
import 'package:millearnia/src/features/course/models/userCourse_enroll_response.dart';
import 'package:millearnia/src/features/course/models/userCourse_request.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'userCourse_enroll_cubit.freezed.dart';

part 'userCourse_enroll_state.dart';
class UserCourseEnrollCubit extends Cubit<UserCourseEnrollState> {
  final CourseRepository _courseRepository;

  UserCourseEnrollCubit({
    CourseRepository? courseRepository,
  })  : _courseRepository = courseRepository ?? locator<CourseRepository>(),
        super(UserCourseEnrollState.initial());
  // recuperer les Course 
  Future<void> inscriptionCours( UserCourseRequest userCourse) async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(UserCourseEnrollState.loading());

    final response = await _courseRepository.enroll(userCourse);
    print('Cubit UserCourseEnroll ${response}');
    response.when(
      success: (data) => emit(UserCourseEnrollState.successUserCourseEnroll( response: data)),
      error: (error) => emit(UserCourseEnrollState.error(error: error)),
    );
  }
}