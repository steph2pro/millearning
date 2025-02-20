import 'package:dio/dio.dart';
import 'package:millearnia/src/datasource/http/dio_config.dart';
import 'package:millearnia/src/datasource/http/profession_api.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/base_repository.dart';
import 'package:millearnia/src/features/home/models/category.dart';
import 'package:millearnia/src/features/home/models/category_response.dart';
import 'package:millearnia/src/features/home/models/profession_response.dart';
import 'package:millearnia/src/features/home/models/video_response.dart';
import 'package:millearnia/src/shared/locator.dart';

class ProfessionRepository extends BaseRepository {
  final ProfessionApi professionApi;

  ProfessionRepository({
    ProfessionApi? professionApi,
  }) : professionApi = professionApi ?? ProfessionApi(dio: locator<DioConfig>().dio);

  Future<ApiResponse<CategoryResponse, ApiError>> getAllCategories() async {
    return runApiCall(
      call: () async {
          // Appel à l'API via l'instance de professionApi
          final response = await professionApi.getCategories();
          // Retourner une réponse réussie
          return ApiResponse.success(CategoryResponse.fromJson(response));
       
      },
    );
  }

   Future<ApiResponse<ProfessionResponse, ApiError>> getAllProfession() async {
    return runApiCall(
      call: () async {
          // Appel à l'API via l'instance de professionApi
          final response = await professionApi.getProfessions();
          // Retourner une réponse réussie
          return ApiResponse.success(ProfessionResponse.fromJson(response));
       
      },
    );
  }
  Future<ApiResponse<ProfessionResponse, ApiError>> getProfessionsByUserInterests(int userId) async {
    return runApiCall(
      call: () async {
        
          final response = await professionApi.getProfessionsByUserInterests(userId);
        
          print("response Repository ****************** ${response} ");
          return ApiResponse.success(ProfessionResponse.fromJson(response));
       
      },
    );
  }
  
   Future<ApiResponse<ProfessionResponse, ApiError>> getAllProfessionCategory(int categoryId) async {
    return runApiCall(
      call: () async {
          // Appel à l'API via l'instance de professionApi
          final response = await professionApi.getProfessionsCategory(categoryId);
          // Retourner une réponse réussie
          return ApiResponse.success(ProfessionResponse.fromJson(response));
       
      },
    );
  }
   Future<ApiResponse<VideoResponse, ApiError>> getAllVideos() async {
    return runApiCall(
      call: () async {
          // Appel à l'API via l'instance de professionApi
          final response = await professionApi.getVideos();
          // Retourner une réponse réussie
          return ApiResponse.success(VideoResponse.fromJson(response));
       
      },
    );
  }
}
