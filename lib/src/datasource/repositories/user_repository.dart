import 'package:dio/dio.dart';
import 'package:millearnia/src/datasource/http/dio_config.dart';
import 'package:millearnia/src/datasource/http/user_api.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/base_repository.dart';
import 'package:millearnia/src/features/auth/login/models/login_request.dart';
import 'package:millearnia/src/features/auth/login/models/login_response.dart';
import 'package:millearnia/src/features/auth/register/model/identify/identify_request.dart';
import 'package:millearnia/src/features/auth/register/model/identify/identify_response.dart';
import 'package:millearnia/src/features/auth/register/model/new_password/new_password_request.dart';
import 'package:millearnia/src/features/auth/register/model/new_password/new_password_response.dart';
import 'package:millearnia/src/features/auth/register/model/otp_code/otp_code_request.dart';
import 'package:millearnia/src/features/auth/register/model/otp_code/otp_code_response.dart';
import 'package:millearnia/src/features/auth/register/model/register_request.dart';
import 'package:millearnia/src/features/auth/register/model/register_response.dart';
import 'package:millearnia/src/features/home/models/user_response.dart';
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

  Future<ApiResponse<IdentifyResponse, ApiError>> verifyUserRepo(IdentifyRequest identifier) async {
    return runApiCall(
      call: () async {
       
          final response = await userApi.verifyUser(identifier);
          
          return ApiResponse.success(IdentifyResponse.fromJson(response));
      },
    );
  }

  Future<ApiResponse<OtpCodeResponse, ApiError>> verifyOtpCodeRepo(OtpCodeRequest otpCode) async {
    return runApiCall(
      call: () async {
       
          final response = await userApi.verifyOtpCode(otpCode);
          
          return ApiResponse.success(OtpCodeResponse.fromJson(response));
      },
    );
  }
  
  Future<ApiResponse<NewPasswordResponse, ApiError>> newpasswordRepo(NewPasswordRequest newpassword) async {
    return runApiCall(
      call: () async {
       
          final response = await userApi.newpassword(newpassword);
          
          return ApiResponse.success(NewPasswordResponse.fromJson(response));
      },
    );
  }
  Future<ApiResponse<UserResponse, ApiError>> getAllMentor() async {
    return runApiCall(
      call: () async {
          // Appel à l'API via l'instance de userApi
          final response = await userApi.getMentors();
          // Retourner une réponse réussie
          return ApiResponse.success(UserResponse.fromJson(response));
       
      },
    );
  }

}
