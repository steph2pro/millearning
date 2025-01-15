import 'package:freezed_annotation/freezed_annotation.dart';

part 'cv_preview_model.freezed.dart';
part 'cv_preview_model.g.dart';

@freezed
class CvPreviewModel with _$CvPreviewModel {
  const factory CvPreviewModel({
    required int id,
    required String imageUrl,
    required List<String> options,
  }) = _CvPreviewModel;

  factory CvPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$CvPreviewModelFromJson(json);
}
