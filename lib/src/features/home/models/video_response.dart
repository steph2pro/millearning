import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/features/home/models/video.dart';

part 'video_response.freezed.dart';
part 'video_response.g.dart';

@freezed
class VideoResponse with _$VideoResponse {

  factory VideoResponse({
    required List<Video> videos
  }) = _VideoResponse;

  factory VideoResponse.fromJson(Map<String, dynamic> json) => _$VideoResponseFromJson(json);
}