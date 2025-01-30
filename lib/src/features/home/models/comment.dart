import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';
import 'package:millearnia/src/features/home/models/profession.dart';
import 'package:millearnia/src/features/home/models/video.dart';
import 'comment_converter.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required int id,
    required int senderId,
    required int professionVideoId,
    required int professionId,
    required Profession profession,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? parentId,
    // @CommentConverter() Comment? parent,
    // @CommentListConverter() List<Comment>? replies,
    required Video? video,
    required UserModel? sender,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
