// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:kamix_mobile/src/datasource/repositories/user_repository.dart';
// import 'package:kamix_mobile/src/shared/locator.dart';

// import '../../../../datasource/models/api_response/api_response.dart';
// import '../../model/request/enter_password_request/enter_password_request.dart';
// import '../../model/response/user_connection/user_connection.dart';

// part 'sign_in_state.dart';
// part 'sign_in_cubit.freezed.dart';

// class SignInCubit extends Cubit<SignInState> {
//   final UserRepository _userRepo;

//   SignInCubit({UserRepository? userRepo})
//       : _userRepo = userRepo ?? locator<UserRepository>(),
//         super(const SignInState.initial());

//   void login(String login) async {
//     if (state.maybeWhen(orElse: () => false, loading: () => true)) return;

//     emit(const SignInState.loading());

//     final response = await _userRepo.login(login);

//     response.whenOrNull(success: (res) {
//       if (res.requestPassword == true) {
//         emit(SignInState.successSetPassword(initialUserData: res));
//       } else {
//         emit(SignInState.successSetOtp(initialUserData: res));
//       }
//     }, error: (error) {
//       emit(SignInState.error(previousState: state, error: error));
//       emit(const SignInState.initial());
//     });
//   }

//   void enterPassword(EnterPasswordRequest request) async {
//     final previousState = state;

//     if (previousState.whenOrNull(successSetPassword: (data) => false) ?? true) return;

//     emit(const SignInState.loading());

//     final response = await _userRepo.enterPassword(request);

//     response.whenOrNull(success: (res) {
//       if (res.confirmConnectionId is String && !(res.deviceRegistered ?? false)) {
//         emit(SignInState.successSetOtp(initialUserData: res));
//       } else if ((res.deviceRegistered ?? false)) {
//         emit(SignInState.failedDeviceRegistrated(initialUserData: res, error: "account registered: ${res.account}"));
//       } else {
//         emit(SignInState.done(initialUserData: res));
//       }
//     }, error: (error) {
//       emit(SignInState.error(previousState: previousState, error: error));
//       _errorToActualState();
//     });
//   }

//   void resendOtp() async {
//     final previousState = state;

//     if ((previousState.whenOrNull(successSetOtp: (data) => false) ?? true) && (previousState.whenOrNull(successResendOtp: (data) => false) ?? true))
//       return;

//     emit(const SignInState.loading());

//     final userConnection = (previousState.whenOrNull(successSetOtp: (data) => data) ?? previousState.whenOrNull(successResendOtp: (data) => data))!;

//     final response = await _userRepo.resendConfirmDeviceConnection(
//       userConnection.user.kid!,
//       (userConnection.confirmConnectionId ?? userConnection.loginIdVerificationId)!,
//     );
//     response.whenOrNull(success: (res) {
//       emit(SignInState.successResendOtp(initialUserData: res));
//     }, error: (error) {
//       emit(SignInState.error(previousState: previousState, error: error));
//       _errorToActualState();
//     });
//   }

//   void confirmOtp(String otp) async {
//     final previousState = state;

//     if ((previousState.whenOrNull(successSetOtp: (data) => false) ?? true) && (previousState.whenOrNull(successResendOtp: (data) => false) ?? true))
//       return;

//     emit(const SignInState.loading());

//     final userConnection = (previousState.whenOrNull(successSetOtp: (data) => data) ?? previousState.whenOrNull(successResendOtp: (data) => data))!;

//     final response = await _userRepo.confirmDeviceConnection(
//         userConnection.user.kid!, (userConnection.confirmConnectionId ?? userConnection.loginIdVerificationId)!, otp);

//     response.whenOrNull(success: (res) {
//       if (userConnection.loginIdVerificationId is String) {
//         return emit(SignInState.successSetPassword(initialUserData: res));
//       }
//       emit(SignInState.done(initialUserData: res));
//     }, error: (error) {
//       emit(SignInState.error(previousState: previousState, error: error));
//       final userConnection = (previousState.whenOrNull(successSetOtp: (data) => data) ?? previousState.whenOrNull(successResendOtp: (data) => data))!;

//       emit(SignInState.successSetOtp(initialUserData: userConnection));
//     });
//   }

//   _errorToActualState() {
//     if ((state.whenOrNull(error: (previuos, error) => false) ?? true)) return;
//     emit(state.whenOrNull(error: (previuos, error) => previuos)!);
//   }
// }