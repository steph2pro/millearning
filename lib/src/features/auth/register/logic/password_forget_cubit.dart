import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:millearnia/src/features/auth/register/model/identify/identify_request.dart';
import 'package:millearnia/src/features/auth/register/model/identify/identify_response.dart';
import 'package:millearnia/src/features/auth/register/model/new_password/new_password_request.dart';
import 'package:millearnia/src/features/auth/register/model/new_password/new_password_response.dart';
import 'package:millearnia/src/features/auth/register/model/otp_code/otp_code_request.dart';
import 'package:millearnia/src/features/auth/register/model/otp_code/otp_code_response.dart';
import 'package:millearnia/src/shared/locator.dart';

part 'password_forget_cubit.freezed.dart';

part 'password_forget_state.dart';

class PasswordForgetCubit extends Cubit<PasswordForgetState> {
  final UserRepository _userRepository;

  PasswordForgetCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        super(PasswordForgetState.initial());

  

  // envoie identifier de l'utilisateur
  Future<void> sendIdentify(IdentifyRequest identifier) async {

    if (state.maybeWhen(orElse: () => false, loading: () => true)) return;

    emit( PasswordForgetState.loading());

    final response = await _userRepository.verifyUserRepo(identifier);

    response.whenOrNull(success: (res) {
      if (res.email is String) {
        emit(PasswordForgetState.successIdentify(response: res));
      } 
      // else {
      //   emit(PasswordForgetState.successSetOtp(initialUserData: res));
      // }
    }, error: (error) {
      emit(PasswordForgetState.error(previousState: state, error: error));
      emit( PasswordForgetState.initial());
    });
  }
  // envoie de l'otp de l'utilisateur
  Future<void> sendOtpCode(OtpCodeRequest otpCode) async {

    if (state.maybeWhen(orElse: () => false, loading: () => true)) return;

    emit( PasswordForgetState.loading());

    final response = await _userRepository.verifyOtpCodeRepo(otpCode);

    response.whenOrNull(success: (res) {
      if (res.success == true) {
        emit(PasswordForgetState.successOtpCodeVerify(response: res));
      } 
      // else {
      //   emit(PasswordForgetState.successSetOtp(initialUserData: res));
      // }
    }, error: (error) {
      emit(PasswordForgetState.error(previousState: state, error: error));
      emit( PasswordForgetState.initial());
    });
  }

  // envoie du new password de l'utilisateur
  Future<void> sendNewPassword(NewPasswordRequest newPassword) async {

    if (state.maybeWhen(orElse: () => false, loading: () => true)) return;

    emit( PasswordForgetState.loading());

    final response = await _userRepository.newpasswordRepo(newPassword);

    response.whenOrNull(success: (res) {
      if (res.success == true) {
        emit(PasswordForgetState.successNewPassword(response: res));
      } 
      // else {
      //   emit(PasswordForgetState.successSetOtp(initialUserData: res));
      // }
    }, error: (error) {
      emit(PasswordForgetState.error(previousState: state, error: error));
      emit( PasswordForgetState.initial());
    });
  }


}
