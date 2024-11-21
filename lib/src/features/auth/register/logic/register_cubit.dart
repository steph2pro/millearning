import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UserRepository _userRepository;

  RegisterCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        super(RegisterState.initial(user: UserModel(email: "",name: "",password: "")));

  // Mettre à jour l'utilisateur avec les nouvelles valeurs saisies
  void updateUser({
    String? email,
    String? password,
    String? name,
  }) {
    final updatedUser = state.user.copyWith(
      email: email ?? state.user.email,
      password: password ?? state.user.password,
      name: name ?? state.user.name,
    );
    emit(RegisterState.updated(user: updatedUser));
  }

  // Enregistrer l'utilisateur
  Future<void> register() async {
    emit(RegisterState.loading(user: state.user));

    final response = await _userRepository.registerUser(state.user);

    response.when(
      success: (data) => emit(RegisterState.success(user: state.user, response: data)),
      error: (error) => emit(RegisterState.error(user: state.user, error: error)),
    );
  }
}

// class RegisterCubit extends Cubit<RegisterState> {
//   final UserRepository _userRepository;

//   RegisterCubit({
//     UserRepository? userRepository,
//     required UserModel initialUser,
//   })  : _userRepository = userRepository ?? locator<UserRepository>(),
//         super(RegisterState.initial(user: initialUser));

//   void onNameChanged(String name) {
//     final updatedUser = state.user.copyWith(name: name);
//     emit(RegisterState.initial(user: updatedUser));
//   }

//   void onEmailChanged(String email) {
//     final updatedUser = state.user.copyWith(email: email);
//     emit(RegisterState.initial(user: updatedUser));
//   }

//   void onPasswordChanged(String password) {
//     final updatedUser = state.user.copyWith(password: password);
//     // emit(RegisterState.initial(user: updatedUser));
//   }

//   Future<void> register() async {
//     emit(RegisterState.loading(user: state.user));

//     final response = await _userRepository.registerUser(state.user);

//     response.when(
//       success: (data) => emit(RegisterState.success(user: state.user, response: data)),
//       error: (error) => emit(RegisterState.error(user: state.user, error: error)),
//     );
//   }
// }
