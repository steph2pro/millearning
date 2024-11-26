import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/http/user_api.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/example_repository.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:millearnia/src/features/auth/login/models/login_request.dart';
import 'package:millearnia/src/features/auth/login/models/login_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository _userRepository;

  LoginCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        super(LoginState.initial());

  
  void login(LoginRequest user) async {
    emit(LoginState.loading());

    final response = await _userRepository.login(user);
    response.when(
      success: (data) => emit(LoginState.success(response: data)),
      error: (error) => emit(LoginState.error(error: error)),
    );
  }
}
