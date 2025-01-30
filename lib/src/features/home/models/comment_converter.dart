import 'package:json_annotation/json_annotation.dart';
import 'comment.dart';

class CommentConverter implements JsonConverter<Comment?, Map<String, dynamic>?> {
  const CommentConverter();

  @override
  Comment? fromJson(Map<String, dynamic>? json) {
    return json == null ? null : Comment.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(Comment? comment) {
    return comment?.toJson();
  }
}

class CommentListConverter
    implements JsonConverter<List<Comment>?, List<Map<String, dynamic>>?> {
  const CommentListConverter();

  @override
  List<Comment>? fromJson(List<Map<String, dynamic>>? json) {
    return json?.map((e) => Comment.fromJson(e)).toList();
  }

  @override
  List<Map<String, dynamic>>? toJson(List<Comment>? comments) {
    return comments?.map((e) => e.toJson()).toList();
  }
}
