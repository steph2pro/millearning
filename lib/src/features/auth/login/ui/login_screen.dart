import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/gen/assets.gen.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/features/auth/login/logic/login_cubit.dart';
import 'package:millearnia/src/features/auth/login/models/login_request.dart';
import 'package:millearnia/src/shared/components/atoms/dividers/labeled_divider.dart';
import 'package:millearnia/src/shared/components/buttons/button.dart';
import 'package:millearnia/src/shared/components/dialogs/dialog_builder.dart';
import 'package:millearnia/src/shared/components/dialogs/notifyer.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/gap.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'package:millearnia/src/core/routing/app_router.dart'; // Importez le fichier principal // Import de la page cible

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
//   void _onLogin() {
//     // FocusScope.of(context).unfocus();
//   if (_formKey.currentState!.validate()) {
//     final user = LoginRequest(
//       email: _emailController.text,
//       password: _passwordController.text,
//     );
   
//     context.read<LoginCubit>().login(user);
//   }
// }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
            loading: () => LoadingDialog.show(context: context),
            success: ( response) {
             LoadingDialog.hide(context: context);
            showSuccesModal(response.message);
            if(response.data != null){
              context.router.push(HomeRoute());
            }

            print (response);
             
            },
            error: ( error) {
               LoadingDialog.hide(context: context);
              showErrorModal(
              'informations incorrect veillez reesayer!'
             );
              
            });
      },
      child: Scaffold(
        backgroundColor: context.colorScheme.onPrimary,
        appBar: AppBar(toolbarHeight: 0),
        body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
      child: SafeArea(
          
          child: ListView(
            padding: const EdgeInsets.all(Dimens.spacing),
            children: [
              const Gap.vertical(height: Dimens.tripleSpacing),
              Text(
                I18n.of(context).signIn,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge,
              ),
              const Gap.vertical(height: Dimens.minSpacing),
              Text(
                I18n.of(context).login_subtitle, 
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                ),
              const Gap.vertical(height: Dimens.tripleSpacing),
              AutofillGroup(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        I18n.of(context).login_emailLabel,
                        style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                      ),
                      Input(
                        autofillHints: const [AutofillHints.email],
                        controller: _emailController,
                        hintText: I18n.of(context).login_emailHint,
                        validator: (value) => InputValidator.emailValidator(context, value),
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap.vertical(height: Dimens.spacing),
                      
                      Text(
                        I18n.of(context).login_passwordLabel,
                        style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                      ),
                      Input(
                        autofillHints: const [AutofillHints.password],
                        controller: _passwordController,
                        isPassword: !_isPasswordVisible,
                        validator: (value)=>InputValidator.passwordValidator(context, value),
                        hintText: I18n.of(context).login_passwordHint,
                        textInputAction: TextInputAction.done,
                        suffixIcon: IconButton(
                          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                          icon: Icon(
                            _isPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        // onSubmitted: (_) => _onLogin(context),
                      ),
                    ],
                  ),
                ),
              ),
              gapH6,
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(I18n.of(context).login_forgotPasswordLabel),
                ),
              ),
              gapH20,
              Button.primary(
                
                title: I18n.of(context).signIn,
                onPressed: (){
                 FocusScope.of(context).unfocus();
                 if (_formKey.currentState!.validate()) {
                    final user = LoginRequest(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  
                    context.read<LoginCubit>().login(user);
                  }
              },
              ),
              const Gap.vertical(height: Dimens.tripleSpacing),
              Padding(padding: EdgeInsets.symmetric(horizontal: 40),
              child: LabeledDivider(
                labelBackgroundColor: context.colorScheme.onPrimary,
                label: I18n.of(context).orSign,
                labelPadding: EdgeInsets.all(8),
              )
              ),
              const Gap.vertical(height: Dimens.tripleSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Container(
                    width: 60,
                    height: 54,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: context.colorScheme.primary.withOpacity(0.3), width: 1.0), // Bordure bleue
                      ),
                    child: IconButton(onPressed: (){}, 
                    icon: SvgPicture.asset(
                      Assets.images.appleLogo,
                      width: Dimens.iconSize,
                      height: Dimens.iconSize,
                      ),
                    ),
                  ),
                  gapW12,
                  Container(
                    width: 60,
                    height: 54,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: context.colorScheme.primary, width: 1.0), // Bordure bleue
                      ),
                    child: IconButton(onPressed: (){}, 
                    icon: SvgPicture.asset(
                      Assets.images.googleLogo,
                      width: Dimens.iconSize,
                      height: Dimens.iconSize,
                      ),
                    ),
                  ),
                  gapW12,
                  Container(
                    width: 60,
                    height: 54,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: context.colorScheme.primary, width: 1.0), // Bordure bleue
                      ),
                    child: IconButton(onPressed: (){}, 
                    icon: Icon(Icons.facebook, color: context.colorScheme.primary,size: Dimens.iconSize,)
                    // SvgPicture.asset(
                    //   Assets.images.googleLogo,
                    //   width: Dimens.iconSize,
                    //   height: Dimens.iconSize,
                    //   ),
                    ),
                  ),
                 
                ],
              ),
              gapH20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  I18n.of(context).dontHaveAccount,
                  style: context.textTheme.bodySmall!.copyWith(fontSize: 15,color: context.colorScheme.onTertiaryContainer)
                  ),
                  gapW4,
                  InkWell(
                    onTap: (){
                      context.router.push(const RegisterRoute());
                    }, 
                    child: Text(
                      I18n.of(context).signUp,
                      style: context.textTheme.bodySmall!.copyWith(fontSize: 16,color: context.colorScheme.primaryContainer)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
       
      ),
    )
    );
  }

  

}
