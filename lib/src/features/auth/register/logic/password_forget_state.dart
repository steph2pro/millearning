part of 'password_forget_cubit.dart';

@freezed
class PasswordForgetState with _$PasswordForgetState {
  factory PasswordForgetState.initial() = _Initial;

  factory PasswordForgetState.loading() = _Loading;

  factory PasswordForgetState.error({
    required PasswordForgetState previousState,
    required ApiError error,
  }) = _Error;

  factory PasswordForgetState.successIdentify({
    required IdentifyResponse response,
  }) = _SuccessIdentify;
  factory PasswordForgetState.successIdentifyPhone({
    required IdentifyResponse response,
  }) = _SuccessIdentifyPhone;

  factory PasswordForgetState.successOtpCodeVerify({
    required OtpCodeResponse response,
  }) = _SuccessOptCode;
  factory PasswordForgetState.successNewPassword({
    required NewPasswordResponse response,
  }) = _SuccessNewPassword;
  
}
