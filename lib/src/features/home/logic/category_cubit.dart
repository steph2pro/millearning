import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/profession_repository.dart';
import 'package:millearnia/src/features/home/models/category_response.dart';
import 'package:millearnia/src/features/home/models/profession_response.dart';
import 'package:millearnia/src/features/home/models/video_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_cubit.freezed.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final ProfessionRepository _professionRepository;

  CategoryCubit({
    ProfessionRepository? professionRepository,
  })  : _professionRepository = professionRepository ?? locator<ProfessionRepository>(),
        super(CategoryState.initial());

  

  // recuperer les categories l'utilisateur
  Future<void> getCategories() async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(CategoryState.loading());

    final response = await _professionRepository.getAllCategories();
    print('Cubit Category ${response}');
    response.when(
      success: (data) => emit(CategoryState.successGetCategories( response: data)),
      error: (error) => emit(CategoryState.error(error: error)),
    );
  }
}