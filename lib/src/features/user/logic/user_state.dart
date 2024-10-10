
part of 'user_cubit.dart';
@freezed
class UserState with _$UserState {
  factory UserState.initial() = _Initial;

  factory UserState.loading() = _Loading;

  factory UserState.error({
    required String error,
  }) = _Error;

  factory UserState.success({
    required List<UserModel> users,
  }) = _Success;
  
  // const factory UserState.failure(String error) = _Failure;
}
