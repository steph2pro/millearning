part of 'user_interest_cubit.dart';

@freezed
class UserInteretState with _$UserInteretState {
  factory UserInteretState.initial() = _Initial;

  factory UserInteretState.loading() = _Loading;

  factory UserInteretState.error({
    required ApiError error,
  }) = _Error;

  factory UserInteretState.success({
    required UserInterestResponse response,
  }) = _Success;
  
}
