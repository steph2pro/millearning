import 'package:dio/dio.dart';
import 'package:millearnia/src/features/auth/login/models/login_request.dart';
import 'package:millearnia/src/features/auth/register/model/identify/identify_request.dart';
import 'package:millearnia/src/features/auth/register/model/new_password/new_password_request.dart';
import 'package:millearnia/src/features/auth/register/model/otp_code/otp_code_request.dart';
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

    print("Utilisateur à envoyer :");
    print(user);

    final identifier = user.email!.isNotEmpty ? user.email : user.phone;

    final response = await dio.post(
      '/auth/login',
      data: {
        "identifier": identifier, // Le champ d'identifiant, soit email soit téléphone
        "password": user.password, // Le mot de passe
      },
    );

    // Retourner les données de la réponse
    return response.data;
  }

  Future<Map<String, dynamic>> verifyUser(IdentifyRequest identifier) async {

    print("identifier à envoyer :");
    print(identifier);
    final ident = identifier.email!.isNotEmpty ? identifier.email : identifier.phone;

    final response = await dio.post(
      '/verify-ident',
      data: {
        "identifier": ident, // Le champ d'identifiant, soit email soit téléphone
      },
    );

    // Retourner les données de la réponse
    return response.data;
  }

  Future<Map<String, dynamic>> verifyOtpCode(OtpCodeRequest otpCode) async {

    print("otpCode à envoyer :");
    print(otpCode);

    final response = await dio.post(
      '/verify-otp',
      data: {
        "otpCode": otpCode.otpCode, 
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> newpassword(NewPasswordRequest new_password) async {

    print("new_password à envoyer :");
    print(new_password);

    final response = await dio.post(
      '/update-password',
      data: new_password.toJson()
    );
    return response.data;
  }


}
