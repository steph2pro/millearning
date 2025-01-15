import 'package:dio/dio.dart';

class CvApi {
  final Dio dio;

  CvApi({required this.dio});

  Future<Map<String, dynamic>> fetchCv( ) async {
   
      final response = await dio.get(
        'template-index',
      );

        return response.data;
      
    
  }
}