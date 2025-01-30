part of 'profession_cubit.dart';


@freezed
class ProfessionState with _$ProfessionState {
  factory ProfessionState.initial() = _Initial;

  factory ProfessionState.loading() = _Loading;

  factory ProfessionState.error({
    required ApiError error,
  }) = _Error;

  factory ProfessionState.successGetProfessions({
    required ProfessionResponse response,
  }) = _SuccessGetProfessions;
  
}
