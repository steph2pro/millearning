import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/profession_repository.dart';
import 'package:millearnia/src/features/home/models/profession_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profession_userInterest_cubit.freezed.dart';
part 'profession_userInterest_state.dart';

class ProfessionUserInterestCubit extends Cubit<ProfessionUserInterestState> {
  final ProfessionRepository _professionRepository;

  ProfessionUserInterestCubit({
    ProfessionRepository? professionRepository,
  })  : _professionRepository = professionRepository ?? locator<ProfessionRepository>(),
        super(ProfessionUserInterestState.initial());

  

  // recuperer les profession l'utilisateur
  Future<void> getProfessionUserInterests(int userId) async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(ProfessionUserInterestState.loading());

    final response = await _professionRepository.getProfessionsByUserInterests(userId);
    print('Cubit Profession***********:  ${response}');
    response.when(
      success: (data) => emit(ProfessionUserInterestState.successGetProfessionUserInterest( response: data)),
      error: (error) => emit(ProfessionUserInterestState.error(error: error)),
    );
  }
  
  
}