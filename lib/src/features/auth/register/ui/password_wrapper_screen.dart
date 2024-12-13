import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/features/auth/register/logic/password_forget_cubit.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';
import 'package:oktoast/oktoast.dart';

import '../../../../core/i18n/l10n.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../shared/components/dialogs/dialog_builder.dart';

@RoutePage()
class PasswordWrapperScreen extends StatefulWidget implements AutoRouteWrapper {
  const PasswordWrapperScreen({super.key});

  @override
  State<PasswordWrapperScreen> createState() => _PasswordWrapperScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (context) => PasswordForgetCubit(), child: this);
  }
}

class _PasswordWrapperScreenState extends State<PasswordWrapperScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordForgetCubit, PasswordForgetState>(
        listenWhen: (previous, current) {
          final isRestoringState = previous.whenOrNull(error: (prev, error) => true) ?? false;
          return !isRestoringState;
        },
        listener: (context, state) {
          state.whenOrNull(
              loading: () => LoadingDialog.show(context: context),
              successIdentify: (data) {
                LoadingDialog.hide(context: context);
                context.pushRoute(const CodeVerifyRoute());
              },
              successOtpCodeVerify: (data) {
                LoadingDialog.hide(context: context);
                context.pushRoute( NewPasswordRoute(otpCodeResponse: data));
              },
              successNewPassword: (data) {
                LoadingDialog.hide(context: context);
                showSuccesModal(data.message);

                context.pushRoute(const LoginRoute());
              },
              // done: (data) {
              //   SharedPrefService.setUserConnection(data);
              //   RequestUtils.secretToken = data.tkn;
              //   RequestUtils.deviceId = data.device;
              //   RequestUtils.kid = data.user.kid;
              //   context.replaceRoute(const AppWrapperRoute());
              // },
              // successSetPassword: (data) {
              //   LoadingDialog.hide(context: context);
              //   context.pushRoute(SignInPasswordRoute(userConnection: data));
              // },
              error: (s, error) {
                LoadingDialog.hide(context: context);
                showErrorModal(error.type == ApiErrorType.user ? error.error.response.data['message'].toString() : 'erreur de connexion');

              });
        },
        child: const AutoRouter());
  }
}