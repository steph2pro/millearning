import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:millearnia/src/features/auth/register/model/register_request.dart';
import 'package:millearnia/src/features/auth/register/model/register_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UserRepository _userRepository;

  RegisterCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        super(RegisterState.initial());

  

  // Enregistrer l'utilisateur
  Future<void> register(RegisterRequest user) async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(RegisterState.loading());

    final response = await _userRepository.registerUser(user);

    response.when(
      success: (data) => emit(RegisterState.success( response: data)),
      error: (error) => emit(RegisterState.error(error: error)),
    );
  }
}
