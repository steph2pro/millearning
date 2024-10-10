import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../datasource/models/user_model.dart';
import '../../../datasource/repositories/user_repository.dart';
import '../../../datasource/models/api_response/api_response.dart';  // Importez ApiResponse
import '../../../shared/locator.dart';  // Assurez-vous que le locator est bien importé

part 'user_cubit.freezed.dart';
part 'user_state.dart';     

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        super(UserState.initial());

  Future<void> loadUsers() async {
    emit(UserState.loading());
    final response = await _userRepository.getUsers();
    response.when(
      success: (users) => emit(UserState.success(users: users)),
      error: (error) => emit(UserState.error(error: error.toString())),
    );
    print("***********************************reponse***********************");
    print (response);
  }
}