import 'package:auto_route/auto_route.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/gap.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/shared/utils/regexp_plus.dart';

import '../../../../datasource/models/api_response/api_response.dart'; // Importez le fichier principal // Import de la page cible

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

  final TextEditingController _phoneController = TextEditingController();
  Country _country = CountryPickerUtils.getCountryByIsoCode('cm');

  bool isPhoneNumber = true;
  String get fullPhoneNumber => '+${_country.phoneCode}${_phoneController.text}';

  void onCountryTap() {
    showCountryPicker(context,
        onValuePicked: (country) => setState(() {
              _country = country;
            }));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget get numberWidget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            I18n.of(context).phone_number,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const Gap.vertical(height: Dimens.halfSpacing),
          Row(
            children: [
              GestureDetector(
                onTap: onCountryTap,
                child: SizedBox(
                  width: 106.0,
                  child: AbsorbPointer(
                    child: Input(
                      controller: TextEditingController(),
                      readOnly: true,
                      hintText: '+${_country.phoneCode}',
                      hintStyle: context.textTheme.bodySmall,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 0, left: 0, top: 10, bottom: 10),
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            backgroundImage: AssetImage(CountryPickerUtils.getFlagImageAssetPath(_country.isoCode), package: 'country_pickers'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Input(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  hintText: 'Ex : 07 80 00 00 00',
                  inputFormatters: mobileFormatters(_phoneController.text.trim(), _country.phoneCode),
                  // inputFormatters: mobileFormatters(_phoneController.text.trim(), _country.phoneCode),
                  textInputAction: TextInputAction.next,
                ),
              )
            ],
          ),
        ],
      );

  Widget get emailWidget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            I18n.of(context).login_emailLabel,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const Gap.vertical(height: Dimens.halfSpacing),
          Input(
            autofillHints: const [AutofillHints.email],
            controller: _emailController,
            hintText: I18n.of(context).login_emailHint,
            validator: (value) => InputValidator.emailValidator(context, value),
            textInputAction: TextInputAction.next,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
              loading: () => LoadingDialog.show(context: context),
              success: (response) async{
                LoadingDialog.hide(context: context);
                showSuccesModal(response.message);
                print(response);
                // if (response.data != null) {
                  final user=response.data;
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                   await prefs.setString('name', user.name);
                   await prefs.setString('email', user.email);
                   await prefs.setString('phone', user.phone);
                  
                  // context.router.push(HomeRoute());
                  context.router.push(CvBuilderRoute());

                // }

              },
              error: (error) {
                LoadingDialog.hide(context: context);

                showErrorModal(error.type == ApiErrorType.user ? error.error.response.data['message'].toString() : 'erreur de connexion');
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
                    style: context.textTheme.titleLarge,
                  ),
                  const Gap.vertical(height: Dimens.minSpacing),
                  Text(I18n.of(context).login_subtitle, textAlign: TextAlign.center, style: context.textTheme.bodySmall?.copyWith(fontSize: 12)),
                  const Gap.vertical(height: Dimens.tripleSpacing),
                  AutofillGroup(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isPhoneNumber ? numberWidget : emailWidget,
                          // const Gap.vertical(height: Dimens.spacing),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isPhoneNumber = !isPhoneNumber;
                                  _phoneController.clear();
                                });
                              },
                              child: Text(
                                  '${I18n.of(context).signInWith} ${!isPhoneNumber ? I18n.of(context).phone_number.toLowerCase() : I18n.of(context).login_emailLabel.toLowerCase()}'),
                            ),
                          ),

                        
                          Text(I18n.of(context).login_passwordLabel, style: context.textTheme.bodySmall?.copyWith(fontSize: 12)),
                          Input(
                            autofillHints: const [AutofillHints.password],
                            controller: _passwordController,
                            isPassword: !_isPasswordVisible,
                            validator: (value) => InputValidator.passwordValidator(context, value),
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
                      onPressed: () {
                        context.router.push(PasswordForgetRoute());
                      },
                      child: Text(I18n.of(context).login_forgotPasswordLabel),
                    ),
                  ),
                  gapH20,
                  Button.primary(
                    title: I18n.of(context).signIn,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        final user = LoginRequest(
                          email: _emailController.text,
                          phone: _phoneController.text,
                          password: _passwordController.text,
                        );

                        context.read<LoginCubit>().login(user);
                      }
                    },
                  ),
                  const Gap.vertical(height: Dimens.tripleSpacing),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: LabeledDivider(
                        labelBackgroundColor: context.colorScheme.onPrimary,
                        label: I18n.of(context).orSign,
                        labelPadding: EdgeInsets.all(8),
                      )),
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
                        child: IconButton(
                          onPressed: () {},
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
                        child: IconButton(
                          onPressed: () {},
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
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.facebook,
                              color: context.colorScheme.primary,
                              size: Dimens.iconSize,
                            )
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
                      Text(I18n.of(context).dontHaveAccount,
                          style: context.textTheme.bodySmall!.copyWith(fontSize: 15, color: context.colorScheme.onTertiaryContainer)),
                      gapW4,
                      InkWell(
                        onTap: () {
                          context.router.push(const RegisterRoute());
                        },
                        child: Text(I18n.of(context).signUp,
                            style: context.textTheme.bodySmall!.copyWith(fontSize: 16, color: context.colorScheme.primaryContainer)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
