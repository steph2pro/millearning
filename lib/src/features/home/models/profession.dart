import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';
import 'package:millearnia/src/features/home/models/comment.dart';
import 'package:millearnia/src/features/home/models/category.dart';
import 'package:millearnia/src/features/home/models/video.dart';

part 'profession.freezed.dart';
part 'profession.g.dart';

@freezed
class Profession with _$Profession {
  const factory Profession({
    required int id,
    required String name,
    required int userId,
    required String thumbnail,
    // required List<String> tabs,
    required int categoryId,
    // required Category category,
    required UserModel user,
    // required List<Video> videos,
    // required List<Comment> comments,
  }) = _Profession;

  factory Profession.fromJson(Map<String, dynamic> json) =>
      _$ProfessionFromJson(json);
}
