import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/cv_preview_model.dart';

part 'cv_preview_response.freezed.dart';
part 'cv_preview_response.g.dart';

@freezed
class CvPreviewResponse with _$CvPreviewResponse {

  factory CvPreviewResponse({
    required String message,
    CvPreviewModel? data,
    String? error

  }) = _CvPreviewResponse;

  factory CvPreviewResponse.fromJson(Map<String, dynamic> json) => _$CvPreviewResponseFromJson(json);
}