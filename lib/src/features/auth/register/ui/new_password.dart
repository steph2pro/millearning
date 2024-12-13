import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/features/auth/register/logic/password_forget_cubit.dart';
import 'package:millearnia/src/features/auth/register/model/new_password/new_password_request.dart';
import 'package:millearnia/src/features/auth/register/model/otp_code/otp_code_response.dart';
import 'package:millearnia/src/shared/components/buttons/button.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/gap.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

@RoutePage()
class NewPasswordScreen extends StatefulWidget {
  final OtpCodeResponse otpCodeResponse;
  const NewPasswordScreen({super.key,required this.otpCodeResponse});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _confirmPasswordValidator(String? value) {
    // if (value == null || value.isEmpty) {
    //   return I18n.of(context).passwordRequired;
    // }
    if (value != _passwordController.text) {
      return 'les mots de pas ne sont pas identique';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.colorScheme.onPrimary,
        title: Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.colorScheme.tertiaryContainer,
                width: 2.0,
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: context.colorScheme.tertiary,
              ),
              onPressed: () {
                context.router.popForced();
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Dimens.spacing),
          children: [
            gapH25,
            Text(
              I18n.of(context).newPassword,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge,
            ),
            const Gap.vertical(height: Dimens.minSpacing),
            Text(
              I18n.of(context).youNewPassword,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
            ),
            gapH30,
            AutofillGroup(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      I18n.of(context).login_passwordLabel,
                      style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
                    ),
                    Input(
                      controller: _passwordController,
                      isPassword: !_isPasswordVisible,
                      hintText: I18n.of(context).login_passwordHint,
                      textInputAction: TextInputAction.done,
                      validator: (value) =>
                          InputValidator.passwordValidator(context, value),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => _isPasswordVisible = !_isPasswordVisible),
                        icon: Icon(
                          _isPasswordVisible
                              ? IconsaxPlusBroken.eye
                              : IconsaxPlusBroken.eye_slash,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    gapH12,
                    Text(
                      I18n.of(context).ConfirmPassword,
                      style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
                    ),
                    Input(
                      controller: _confirmPasswordController,
                      isPassword: !_isPasswordVisible,
                      hintText: I18n.of(context).login_passwordHint,
                      textInputAction: TextInputAction.done,
                      validator: _confirmPasswordValidator,
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => _isPasswordVisible = !_isPasswordVisible),
                        icon: Icon(
                          _isPasswordVisible
                              ? IconsaxPlusBroken.eye
                              : IconsaxPlusBroken.eye_slash,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            gapH25,
            Button.primary(
              title: I18n.of(context).createNewPassword,
              onPressed: () {
                
                   final newPassword = NewPasswordRequest(
                    phone: widget.otpCodeResponse.phone,
                    newPassword: _passwordController.text ,
                    accessToken: widget.otpCodeResponse.accessToken,
                   );
                if (_formKey.currentState?.validate() ?? false) {
                  
                      context.read<PasswordForgetCubit>().sendNewPassword(newPassword);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
