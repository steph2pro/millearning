import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/features/home/models/comment.dart';
import 'package:millearnia/src/features/home/models/comment_converter.dart';
import 'package:millearnia/src/features/home/models/profession.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
class Video with _$Video {
  const factory Video({
    required int id,
    required int professionId,
    required String title,
    required String youtubeId,
    required String thumbnail,
    // required Comment comments,
    // @CommentListConverter() List<Comment>? comments,
    // required List<Profession> professions,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) =>
      _$VideoFromJson(json);
}
