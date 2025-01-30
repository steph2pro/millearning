part of 'mentor_cubit.dart';


@freezed
class MentorState with _$MentorState {
  factory MentorState.initial() = _Initial;

  factory MentorState.loading() = _Loading;

  factory MentorState.error({
    required ApiError error,
  }) = _Error;

  factory MentorState.successGetMentors({
    required UserResponse response,
  }) = _SuccessGetMentors;
  
}
