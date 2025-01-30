import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/profession_repository.dart';
import 'package:millearnia/src/features/home/models/profession_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profession_cubit.freezed.dart';
part 'profession_state.dart';

class ProfessionCubit extends Cubit<ProfessionState> {
  final ProfessionRepository _professionRepository;

  ProfessionCubit({
    ProfessionRepository? professionRepository,
  })  : _professionRepository = professionRepository ?? locator<ProfessionRepository>(),
        super(ProfessionState.initial());

  

  // recuperer les profession l'utilisateur
  Future<void> getProfessions() async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(ProfessionState.loading());

    final response = await _professionRepository.getAllProfession();
    print('Cubit Profession ${response}');
    response.when(
      success: (data) => emit(ProfessionState.successGetProfessions( response: data)),
      error: (error) => emit(ProfessionState.error(error: error)),
    );
  }
  
  // recuperer les profession l'utilisateur
  Future<void> getProfessionsCategory(int categoryId) async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(ProfessionState.loading());

    final response = await _professionRepository.getAllProfessionCategory(categoryId);
    print('Cubit Profession ${response}');
    response.when(
      success: (data) => emit(ProfessionState.successGetProfessions( response: data)),
      error: (error) => emit(ProfessionState.error(error: error)),
    );
  }
}