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
  
    // final response = await dio.post(
    //   '/auth/login', 
    //   data:user.toJson()
    //   );
    // return response.data;
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

}
