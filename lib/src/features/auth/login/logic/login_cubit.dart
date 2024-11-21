import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/http/auth_user.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/example_repository.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository _userRepository;

  LoginCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        super(LoginState.initial(email: '', password: ''));

  void onEmailChanged(String email) {
    emit(LoginState.initial(email: email, password: state.password));
  }

  void onPasswordChanged(String password) {
    emit(LoginState.initial(password: password, email: state.email));
  }

  void login() async {
    emit(LoginState.loading(email: state.email, password: state.password));

    final response = await _userRepository.login(email: state.email,password: state.password);
    response.when(
      success: (data) => emit(LoginState.success(email: state.email, password: state.password, response: data)),
      error: (error) => emit(LoginState.error(email: state.email, password: state.password, error: error)),
    );
  }
}
