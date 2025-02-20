import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:millearnia/src/features/centre_interet/models/user_interest_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_interest_cubit.freezed.dart';
part 'user_interest_state.dart';

class UserInteretCubit extends Cubit<UserInteretState> {
  final UserRepository _userRepository;

  UserInteretCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        super(UserInteretState.initial());

  

  // Enregistrer l'utilisateur
  Future<void> getInterest(int id) async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(UserInteretState.loading());

    final response = await _userRepository.getUserInterest(id);
    print(response);
    response.when(
      success: (data) => emit(UserInteretState.success( response: data)),
      error: (error) => emit(UserInteretState.error(error: error)),
    );
  }
}
