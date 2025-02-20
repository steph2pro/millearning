import 'package:dio/dio.dart';
import 'package:millearnia/src/features/course/models/userCourse_request.dart';
import 'package:millearnia/src/features/home/models/category.dart';

class CourseApi {
  final Dio dio;

  CourseApi({required this.dio});

  Future<Map<String, dynamic>> getCourses() async {
   
      final response = await dio.get(
        '/course-index',
      );

        return response.data;      
  }
  
  Future<Map<String, dynamic>> enrollUser(UserCourseRequest userCourse) async {

      print("Utilisateur à envoyer :");
      print(userCourse);

      final response = await dio.post(
        '/enroll',
        data: {
          "userId": userCourse.userId, 
          "courseId": userCourse.courseId,
        },
      );

      // Retourner les données de la réponse
      return response.data;
    }
    
  Future<Map<String, dynamic>> userCourses( int userId) async {
   
      final response = await dio.get(
        '/user-courses/$userId',
      );

      return response.data;      
  }
  Future<Map<String, dynamic>> getCoursesByUserInterest( int userId) async {
   
      final response = await dio.get(
        '/orientation-getCoursesByUserInterests/$userId',
      );

      return response.data;      
  }

  }