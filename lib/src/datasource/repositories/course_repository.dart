import 'package:dio/dio.dart';
import 'package:millearnia/src/datasource/http/dio_config.dart';
import 'package:millearnia/src/datasource/http/Course_api.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/base_repository.dart';
import 'package:millearnia/src/features/course/models/userCourse_enroll_response.dart';
import 'package:millearnia/src/features/course/models/userCourse_request.dart';
import 'package:millearnia/src/features/course/models/userCourse_response.dart';
import 'package:millearnia/src/features/home/models/course_response.dart';
import 'package:millearnia/src/shared/locator.dart';

class CourseRepository extends BaseRepository {
  final CourseApi courseApi;

  CourseRepository({
    CourseApi? courseApi,
  }) : courseApi = courseApi ?? CourseApi(dio: locator<DioConfig>().dio);

  Future<ApiResponse<CourseResponse, ApiError>> getAllCourse() async {
    return runApiCall(
      call: () async {
          // Appel à l'API via l'instance de CourseApi
          final response = await courseApi.getCourses();
          // Retourner une réponse réussie
          return ApiResponse.success(CourseResponse.fromJson(response));
       
      },
    );
  }
   Future<ApiResponse<UserCourseEnrollResponse, ApiError>> enroll(UserCourseRequest userCourse) async {
    return runApiCall(
      call: () async {
          final response = await courseApi.enrollUser(userCourse);
          return ApiResponse.success(UserCourseEnrollResponse.fromJson(response));
      },
    );
  }
  Future<ApiResponse<UserCourseResponse, ApiError>> userCourses(int userId) async {
    return runApiCall(
      call: () async {
          // Appel à l'API via l'instance de CourseApi
          final response = await courseApi.userCourses(userId);
          // Retourner une réponse réussie
          return ApiResponse.success(UserCourseResponse.fromJson(response));
       
      },
    );
  }
  Future<ApiResponse<CourseResponse, ApiError>> getCoursesByUserInterests(int userId) async {
    return runApiCall(
      call: () async {
          // Appel à l'API via l'instance de CourseApi
          final response = await courseApi.getCoursesByUserInterest(userId);
          // Retourner une réponse réussie
          return ApiResponse.success(CourseResponse.fromJson(response));
       
      },
    );
  }
}