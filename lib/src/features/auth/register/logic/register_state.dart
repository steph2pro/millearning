part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState.initial() = _Initial;

  factory RegisterState.loading() = _Loading;

  factory RegisterState.error({
    required ApiError error,
  }) = _Error;

  factory RegisterState.success({
    required RegisterResponse response,
  }) = _Success;
  
}
