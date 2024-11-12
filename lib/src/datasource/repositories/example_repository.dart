import 'package:millearnia/src/datasource/http/dio_config.dart';
import 'package:millearnia/src/datasource/http/example_api.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/base_repository.dart';
import 'package:millearnia/src/shared/locator.dart';

class ExampleRepository extends BaseRepository {
  final ExampleApi exampleApi;

  ExampleRepository({
    ExampleApi? exampleApi,
  }) : exampleApi = exampleApi ?? ExampleApi(dio: locator<DioConfig>().dio);

  Future<ApiResponse<String, ApiError>> getExample() async {
    return runApiCall(
      call: () async {
        final response = await exampleApi.getExample();
        return ApiResponse.success(response);
      },
    );
  }
}
