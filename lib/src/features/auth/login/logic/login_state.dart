part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState.initial() = _Initial;

  factory LoginState.loading() = _Loading;

  factory LoginState.error({
    required ApiError error,
  }) = _Error;

  factory LoginState.success({
    required LoginResponse response,
  }) = _Success;
}
