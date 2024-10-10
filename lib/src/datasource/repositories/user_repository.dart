import 'package:flutter_kit/src/datasource/http/dio_config.dart';
import 'package:flutter_kit/src/datasource/http/random_user_api.dart';
import 'package:flutter_kit/src/datasource/models/api_response/api_response.dart';
import 'package:flutter_kit/src/datasource/repositories/base_repository.dart';
import 'package:flutter_kit/src/shared/locator.dart';
import '../models/user_model.dart';

class UserRepository extends BaseRepository {
  final RandomUserApi randomUserApi;

  UserRepository({
    RandomUserApi? randomUserApi,
  }) : randomUserApi = randomUserApi ?? RandomUserApi(dio: locator<DioConfig>().dio);

  Future<ApiResponse<List<UserModel>, ApiError>> getUsers() async {
    return runApiCall(
      call: () async {
        final response = await randomUserApi.fetchRandomUsers();
        return ApiResponse.success(response);
      },
    );
  }
}
