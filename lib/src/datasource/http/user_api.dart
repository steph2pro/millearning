import 'package:dio/dio.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';
import 'package:millearnia/src/features/auth/login/models/login_request.dart';
import 'package:millearnia/src/features/auth/register/model/register_request.dart';

class UserApi {
  final Dio dio;

  UserApi({required this.dio});

  Future<Map<String, dynamic>> registerUser(RegisterRequest user) async {
   
      final response = await dio.post(
        '/auth/register',
        data: user.toJson(),
      );

        return response.data;
      
    
  }



Future<Map<String, dynamic>> loginUser(LoginRequest user) async {
  
    final response = await dio.post(
      '/auth/login', 
      data:user.toJson()
      );
    return response.data;

    
}

}
