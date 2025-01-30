import 'package:dio/dio.dart';
import 'package:millearnia/src/features/home/models/category.dart';
import 'package:millearnia/src/features/home/models/profession.dart';

class ProfessionApi {
  final Dio dio;

  ProfessionApi({required this.dio});

  Future<Map<String, dynamic>> getProfessions() async {
   
      final response = await dio.get(
        '/orientation-getAllPof',
      );

        return response.data;
        // return {
        //   "professions": response.data
        // };      
  }
  
 Future<Map<String, dynamic>> getProfessionsCategory(int categoryId) async {
  final response = await dio.get(
    '/orientation-getPofByCategoryId/$categoryId',
  );

  return response.data;
}

    Future<Map<String, dynamic>> getVideos() async {
   
      final response = await dio.get(
        '/orientation-getAllVideo',
      );

        return response.data;
      
  }
  Future<Map<String, dynamic>> getCategories() async {
   
      final response = await dio.get(
        '/orientation-getAllCat',
      );

        return response.data;
      
    
  }
}