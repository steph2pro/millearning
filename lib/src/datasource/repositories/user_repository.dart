import 'package:dio/dio.dart';
import 'package:millearnia/src/datasource/http/dio_config.dart';
import 'package:millearnia/src/datasource/http/auth_user.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/base_repository.dart';
import 'package:millearnia/src/shared/locator.dart';
import '../models/user_model.dart';

class UserRepository extends BaseRepository {
  final AuthUser authUser;

  UserRepository({
    AuthUser? authUser,
  }) : authUser = authUser ?? AuthUser(dio: locator<DioConfig>().dio);

  Future<ApiResponse<String, ApiError>> registerUser(UserModel user) async {
    return runApiCall(
      call: () async {
        try {
          // Appeler le service AuthUser pour enregistrer l'utilisateur
          final response = await authUser.registerUser(user);

          // Gestion du succès
          // return ApiResponse.success(response['data']);
          if (response.containsKey('message')) {
            return ApiResponse.success(response['message']);
          } else {
            throw ApiError(
              type: ApiErrorType.server,
              statusCode: response['statusCode'] ?? 500,
              error: 'La réponse ne contient pas de données valides.',
            );
          }
        } on ApiError catch (apiError) {
          // Gérer une erreur déjà formatée sous forme d'ApiError
          return ApiResponse.error(apiError);
        } catch (e) {
          // Gestion générique des erreurs inconnues
          return ApiResponse.error(
            ApiError.unknown(
              error: e,
              message: 'Une erreur inattendue est survenue',
            ),
          );
        }
      },
    );
  }

  Future<ApiResponse<UserModel, ApiError>> login({
    required String email,
    required String password,
  }) async {
    return runApiCall(
      call: () async {
        try {
          // Appeler le service AuthUser pour effectuer la connexion
          final response = await authUser.loginUser(email: email, password: password);
          final user = response;
          return ApiResponse.success(user);
          
        } on ApiError catch (apiError) {
          // Gérer une erreur déjà formatée sous forme d'ApiError
          return ApiResponse.error(apiError);
        } catch (e) {
          // Gestion générique des erreurs inconnues
          return ApiResponse.error(
            ApiError.unknown(
              error: e,
              message: 'Une erreur inattendue est survenue',
            ),
          );
        }
      },
    );
  }

}
