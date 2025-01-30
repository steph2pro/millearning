import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:millearnia/src/features/home/models/user_response.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mentor_cubit.freezed.dart';
part 'mentor_state.dart';

class MentorCubit extends Cubit<MentorState> {
  final UserRepository _mentorRepository;

  MentorCubit({
    UserRepository? mentorRepository,
  })  : _mentorRepository = mentorRepository ?? locator<UserRepository>(),
        super(MentorState.initial());

  

  // recuperer les Mentor 
  Future<void> getMentors() async {
    if(state.whenOrNull(loading: ()=>true) == true) return;
    emit(MentorState.loading());

    final response = await _mentorRepository.getAllMentor();
    print('Cubit Mentor ${response}');
    response.when(
      success: (data) => emit(MentorState.successGetMentors( response: data)),
      error: (error) => emit(MentorState.error(error: error)),
    );
  }
}