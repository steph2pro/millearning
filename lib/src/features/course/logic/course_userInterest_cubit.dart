import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/course_repository.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:millearnia/src/features/home/models/course_response.dart';
import 'package:millearnia/src/features/home/models/user_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_userInterest_cubit.freezed.dart';
part 'course_userInterest_state.dart';

class CourseUserInterestCubit extends Cubit<CourseUserInterestState> {
  final CourseRepository _courseRepository;

  CourseUserInterestCubit({
    CourseRepository? courseRepository,
  })  : _courseRepository = courseRepository ?? locator<CourseRepository>(),
        super(CourseUserInterestState.initial());
  // recuperer les Course 
  Future<void> getCourseUserInterests(int userId) async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(CourseUserInterestState.loading());

    final response = await _courseRepository.getCoursesByUserInterests(userId);
    print('Cubit Course ${response}');
    response.when(
      success: (data) => emit(CourseUserInterestState.successGetCourseUserInterests( response: data)),
      error: (error) => emit(CourseUserInterestState.error(error: error)),
    );
  }
}