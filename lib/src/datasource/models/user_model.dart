import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/userCourse.dart';
import 'package:millearnia/src/features/home/models/comment.dart';
import 'package:millearnia/src/features/home/models/profession.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
  const factory UserModel({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String password,
     String? profil,
    String? accessToken,
    required String role,
    required String status,
    // required DateTime createdAt,
    // required DateTime updatedAt,
    // List<Profession>? professions,
    // List<Comment>? comments,

    @Default([]) List<String> interests,
    @Default([]) List<UserCourse> courses,
    
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
