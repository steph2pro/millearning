import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/shared/components/buttons/button.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/gap.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:millearnia/src/core/routing/app_router.dart'; // Importez le fichier principal // Import de la page cible

@RoutePage()
class NewPasswordScreen extends StatefulWidget{
// class NewPasswordScreen extends StatefulWidget implements AutoRouteWrapper {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();

  // @override
  // Widget wrappedRoute(BuildContext context) {
  //   return BlocProvider(
  //     create: (_) => NewPasswordCubit(),
  //     child: this,
  //   );
  // }
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

  @override
  Widget build(BuildContext context) {
    return 
    //BlocListener<RegisterCubit, RegisterState>(
    //   listener: (context, state) {
    //     state.whenOrNull(
    //   },
      // child:
       Scaffold(
        backgroundColor: context.colorScheme.onPrimary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: context.colorScheme.onPrimary,
          title: Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: context.colorScheme.tertiaryContainer, width: 2.0), // Bordure bleue
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: context.colorScheme.tertiary), // Icône bleue
                        onPressed: () {
                           context.router.popForced();
                        },
                      ),
                    ),
          )
        ),
        body: SafeArea(
          
          child: ListView(
            padding: const EdgeInsets.all(Dimens.spacing),
            children: [
              gapH25,
              Text(
                I18n.of(context).newPassword,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge,
              ),
              const Gap.vertical(height: Dimens.minSpacing),
              Text(
                I18n.of(context).youNewPassword, 
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
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
                        style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                      ),
                      Input(
                        autofillHints: const [AutofillHints.password],
                        controller: _passwordController,
                        isPassword: !_isPasswordVisible,
                        hintText: I18n.of(context).login_passwordHint,
                        // onChanged: context.read<RegisterCubit>().onPasswordChanged,
                        textInputAction: TextInputAction.done,
                        suffixIcon: IconButton(
                          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                          icon: Icon(
                            _isPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        // onSubmitted: (_) => _onRegister(),
                      ),
                      gapH12,
                      Text(
                        I18n.of(context).ConfirmPassword,
                        style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                      ),
                      
                      Input(
                        autofillHints: const [AutofillHints.password],
                        controller: _passwordController,
                        isPassword: !_isPasswordVisible,
                        // onChanged: context.read<RegisterCubit>().onPasswordChanged,
                        textInputAction: TextInputAction.done,
                        suffixIcon: IconButton(
                          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                          icon: Icon(
                            _isPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        // onSubmitted: (_) => _onRegister(),
                      ),
                    ],
                  ),
                ),
              ),
             
             gapH25,
              Button.primary(
                
                title: I18n.of(context).createNewPassword,
                onPressed: (){
                  context.router.push(ProfileRoute());
                },
              ),
              
            ],
          ),
        ),
       
      );
    // );
  }

  // void _onRegister() => context.read<RegisterCubit>().Register();
}
