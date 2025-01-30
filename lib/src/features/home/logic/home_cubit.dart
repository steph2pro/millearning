import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/profession_repository.dart';
import 'package:millearnia/src/features/home/models/category_response.dart';
import 'package:millearnia/src/features/home/models/profession_response.dart';
import 'package:millearnia/src/features/home/models/video_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProfessionRepository _professionRepository;

  HomeCubit({
    ProfessionRepository? professionRepository,
  })  : _professionRepository = professionRepository ?? locator<ProfessionRepository>(),
        super(HomeState.initial());

  

  // recuperer les categories l'utilisateur
  Future<void> getCategories() async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(HomeState.loading());

    final response = await _professionRepository.getAllCategories();
    print('Cubit Home ${response}');
    response.when(
      success: (data) => emit(HomeState.successGetCategories( response: data)),
      error: (error) => emit(HomeState.error(error: error)),
    );
  }
  // recuperer les profession l'utilisateur
  Future<void> getProfessions() async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(HomeState.loading());

    final response = await _professionRepository.getAllProfession();
    print('Cubit Home ${response}');
    response.when(
      success: (data) => emit(HomeState.successGetProfessions( response: data)),
      error: (error) => emit(HomeState.error(error: error)),
    );
  }

  // recuperer les video l'utilisateur
  Future<void> getVideos() async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(HomeState.loading());

    final response = await _professionRepository.getAllVideos();
    print('Cubit Home ${response}');
    response.when(
      success: (data) => emit(HomeState.successGetVideos( response: data)),
      error: (error) => emit(HomeState.error(error: error)),
    );
  }
}
