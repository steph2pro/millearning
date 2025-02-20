import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:millearnia/src/features/centre_interet/models/interet_request.dart';
import 'package:millearnia/src/features/centre_interet/models/interet_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'interet_cubit.freezed.dart';
part 'interet_state.dart';

class InteretCubit extends Cubit<InteretState> {
  final UserRepository _userRepository;

  InteretCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        super(InteretState.initial());

  

  // Enregistrer l'utilisateur
  Future<void> interetSave(InteretRequest interet) async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(InteretState.loading());

    final response = await _userRepository.saveInteret(interet);

    response.when(
      success: (data) => emit(InteretState.success( response: data)),
      error: (error) => emit(InteretState.error(error: error)),
    );
  }
}
