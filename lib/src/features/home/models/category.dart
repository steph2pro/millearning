import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/features/home/models/profession.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String title,
    required String icon,
    // List<Profession>? professions,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
