
import 'package:millearnia/src/datasource/http/cv_api.dart';
import 'package:millearnia/src/datasource/http/dio_config.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/base_repository.dart';
import 'package:millearnia/src/features/cv/models/cv_preview_response.dart';
import 'package:millearnia/src/shared/locator.dart';

class CvRepository extends BaseRepository {
  final CvApi cvApi;

  CvRepository({
    CvApi? cvApi,
  }) : cvApi = cvApi ?? CvApi(dio: locator<DioConfig>().dio);

  Future<ApiResponse<CvPreviewResponse, ApiError>> fetch() async {
    return runApiCall(
      call: () async {
        
          final response = await cvApi.fetchCv();
          return ApiResponse.success(CvPreviewResponse.fromJson(response));
      }
    );
  }
}