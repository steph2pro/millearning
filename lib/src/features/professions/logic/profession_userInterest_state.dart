part of 'profession_userInterest_cubit.dart';


@freezed
class ProfessionUserInterestState with _$ProfessionUserInterestState {
  factory ProfessionUserInterestState.initial() = _Initial;

  factory ProfessionUserInterestState.loading() = _Loading;

  factory ProfessionUserInterestState.error({
    required ApiError error,
  }) = _Error;

  factory ProfessionUserInterestState.successGetProfessionUserInterest({
    required ProfessionResponse response,
  }) = _SuccessGetProfessionUserInterest;
  
}
