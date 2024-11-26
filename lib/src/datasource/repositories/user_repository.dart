import 'package:dio/dio.dart';
import 'package:millearnia/src/datasource/http/dio_config.dart';
import 'package:millearnia/src/datasource/http/user_api.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/base_repository.dart';
import 'package:millearnia/src/features/auth/login/models/login_request.dart';
import 'package:millearnia/src/features/auth/login/models/login_response.dart';
import 'package:millearnia/src/features/auth/register/model/register_request.dart';
import 'package:millearnia/src/features/auth/register/model/register_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import '../models/user_model.dart';

class UserRepository extends BaseRepository {
  final UserApi userApi;

  UserRepository({
    UserApi? userApi,
  }) : userApi = userApi ?? UserApi(dio: locator<DioConfig>().dio);

  Future<ApiResponse<RegisterResponse, ApiError>> registerUser(RegisterRequest user) async {
    return runApiCall(
      call: () async {
        
          final response = await userApi.registerUser(user);

          return ApiResponse.success(RegisterResponse.fromJson(response));
      }
    );
  }

  Future<ApiResponse<LoginResponse, ApiError>> login(LoginRequest user) async {
    return runApiCall(
      call: () async {
       
          final response = await userApi.loginUser(user);
          
          return ApiResponse.success(LoginResponse.fromJson(response));
          
       
        
      },
    );
  }

}
