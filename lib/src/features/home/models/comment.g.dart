// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: (json['id'] as num).toInt(),
      senderId: (json['senderId'] as num).toInt(),
      professionVideoId: (json['professionVideoId'] as num).toInt(),
      professionId: (json['professionId'] as num).toInt(),
      profession:
          Profession.fromJson(json['profession'] as Map<String, dynamic>),
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      parentId: (json['parentId'] as num?)?.toInt(),
      video: json['video'] == null
          ? null
          : Video.fromJson(json['video'] as Map<String, dynamic>),
      sender: json['sender'] == null
          ? null
          : UserModel.fromJson(json['sender'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'professionVideoId': instance.professionVideoId,
      'professionId': instance.professionId,
      'profession': instance.profession.toJson(),
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'parentId': instance.parentId,
      'video': instance.video?.toJson(),
      'sender': instance.sender?.toJson(),
    };
