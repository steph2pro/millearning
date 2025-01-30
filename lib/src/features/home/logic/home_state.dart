part of 'home_cubit.dart';


@freezed
class HomeState with _$HomeState {
  factory HomeState.initial() = _Initial;

  factory HomeState.loading() = _Loading;

  factory HomeState.error({
    required ApiError error,
  }) = _Error;

  factory HomeState.successGetCategories({
    required CategoryResponse response,
  }) = _SuccessGetCategories;
  factory HomeState.successGetProfessions({
    required ProfessionResponse response,
  }) = _SuccessGetProfessions;
  factory HomeState.successGetVideos({
    required VideoResponse response,
  }) = _SuccessGetVideos;
  
}
