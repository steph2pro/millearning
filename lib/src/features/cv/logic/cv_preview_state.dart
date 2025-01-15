part of 'cv_preview_cubit.dart';

@freezed
class CvPreviewState with _$CvPreviewState {
  factory CvPreviewState.initial() = _Initial;

  factory CvPreviewState.loading() = _Loading;

  factory CvPreviewState.error({
    required ApiError error,
  }) = _Error;

  factory CvPreviewState.success({
    required CvPreviewResponse response,
  }) = _Success;
  
}
