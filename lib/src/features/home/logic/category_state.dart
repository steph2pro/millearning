part of 'category_cubit.dart';


@freezed
class CategoryState with _$CategoryState {
  factory CategoryState.initial() = _Initial;

  factory CategoryState.loading() = _Loading;

  factory CategoryState.error({
    required ApiError error,
  }) = _Error;

  factory CategoryState.successGetCategories({
    required CategoryResponse response,
  }) = _SuccessGetCategories;
  // factory CategoryState.successGetProfessions({
  //   required ProfessionResponse response,
  // }) = _SuccessGetProfessions;
  // factory CategoryState.successGetVideos({
  //   required VideoResponse response,
  // }) = _SuccessGetVideos;
  
}
