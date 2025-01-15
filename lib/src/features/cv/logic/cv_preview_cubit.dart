import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/cv_repository.dart';
import 'package:millearnia/src/features/cv/models/cv_preview_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cv_preview_cubit.freezed.dart';
part 'cv_preview_state.dart';

class CvPreviewCubit extends Cubit<CvPreviewState> {
  final CvRepository _cvRepository;

  CvPreviewCubit({
    CvRepository? cvRepository,
  })  : _cvRepository = cvRepository ?? locator<CvRepository>(),
        super(CvPreviewState.initial());

  

  // recuperation des cv
  Future<void> fetchAllCv() async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(CvPreviewState.loading());

    final response = await _cvRepository.fetch();

    response.when(
      success: (data) => emit(CvPreviewState.success( response: data)),
      error: (error) => emit(CvPreviewState.error(error: error)),
    );
  }
}
