import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/course_repository.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:millearnia/src/features/home/models/course_response.dart';
import 'package:millearnia/src/features/home/models/user_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_cubit.freezed.dart';
part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepository _courseRepository;

  CourseCubit({
    CourseRepository? courseRepository,
  })  : _courseRepository = courseRepository ?? locator<CourseRepository>(),
        super(CourseState.initial());
  // recuperer les Course 
  Future<void> getCourses() async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(CourseState.loading());

    final response = await _courseRepository.getAllCourse();
    print('Cubit Course ${response}');
    response.when(
      success: (data) => emit(CourseState.successGetCourses( response: data)),
      error: (error) => emit(CourseState.error(error: error)),
    );
  }
}