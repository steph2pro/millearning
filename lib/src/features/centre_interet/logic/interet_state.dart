part of 'interet_cubit.dart';

@freezed
class InteretState with _$InteretState {
  factory InteretState.initial() = _Initial;

  factory InteretState.loading() = _Loading;

  factory InteretState.error({
    required ApiError error,
  }) = _Error;

  factory InteretState.success({
    required InteretResponse response,
  }) = _Success;
  
}
