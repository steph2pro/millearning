import 'package:dio/dio.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';

class AuthUser {
  final Dio dio;

  AuthUser({required this.dio});

  Future<Map<String, dynamic>> registerUser(UserModel user) async {
    try {
      print('Utilisateur à envoyer :');
      print(user.toJson());

      final response = await dio.post(
        '/auth/register',
        data: user.toJson(),
      );

      if (response.statusCode == 201) {
        // Retourner la réponse de l'API sous forme de Map
        return response.data;
      } else {
        // Gérer les réponses non réussies de l'API
        return {
          'success': false,
          'message': response.data['message'] ?? 'Erreur lors de l\'inscription',
        };
      }
    } on DioError catch (dioError) {
      // Gérer les erreurs spécifiques à Dio
      if (dioError.response != null) {
        return {
          'success': false,
          'message': dioError.response?.data['message'] ?? 'Erreur API inconnue',
          'statusCode': dioError.response?.statusCode,
          'errors': dioError.response?.data['errors'] ?? [],
        };
      } else {
        return {
          'success': false,
          'message': 'Erreur réseau ou de connexion',
          'details': dioError.message,
        };
      }
    } catch (e) {
      // Gérer toutes les autres erreurs
      return {
        'success': false,
        'message': 'Une erreur inattendue est survenue',
        'details': e.toString(),
      };
    }
  }
//  Future<UserModel> loginUser({required String email, required String password}) async {
//     try {

//       print('Utilisateur à envoyer :');
//       final response = await dio.post('/auth/login', data: {
//         'email': email,
//         'password': password,
//       });

//       if (response.statusCode == 201) {
//         return UserModel.fromJson(response.data['data']);
//       } else {
//         throw Exception(response.data['message'] ?? 'Login failed');
//       }
//      } catch (e) {
//       throw Exception('An error occurred: ${e.toString()}');
//     }
  
//   }
Future<UserModel> loginUser({
  required String email,
  required String password,
}) async {
  try {
    final response = await dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 201) {
      final data = response.data['data'];
      final user = UserModel.fromJson(data);
      // final accessToken = data['accesToken'];
      // user.accessToken = accessToken;

      // Message de succès renvoyé par l'API
      final successMessage = response.data['message'] ?? 'Login successful';
      print(successMessage);  // Affiche le message de succès
      return user;
    } else {
      final errorMessage = response.data['message'] ?? 'Login failed';
      throw Exception(errorMessage);  // Lancer une exception avec le message d'erreur
    }
  } catch (e) {
    // Gérer l'erreur générée par le backend ou un problème réseau
    throw Exception('An error occurred: ${e.toString()}');
  }
}

}
