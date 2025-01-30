import 'package:dio/dio.dart';
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
}