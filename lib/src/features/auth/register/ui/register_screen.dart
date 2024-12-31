import 'package:auto_route/auto_route.dart';
import 'package:country_pickers/country.dart';
// import 'package:country_picker/country_picker.dart' hide Country;
import 'package:country_pickers/country_pickers.dart' as cps;
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/features/auth/register/model/register_request.dart';
import 'package:millearnia/src/shared/components/dialogs/dialog_builder.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/gap.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/features/auth/register/logic/register_cubit.dart';
import 'package:millearnia/src/shared/utils/regexp_plus.dart';

import '../../../../datasource/models/api_response/api_response.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegisterScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: this,
    );
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Keys and controllers
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // States
  bool _isChecked = false;
  bool _isPasswordVisible = false;

  final TextEditingController _phoneController = TextEditingController();
  Country _country = CountryPickerUtils.getCountryByIsoCode('cm');

  // bool isPhoneNumber = true;
  // String get fullPhoneNumber => '+${_country.phoneCode}${_phoneController.text}';

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
    _nameController.dispose();
    super.dispose();
  }

  void _onRegister(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      final user = RegisterRequest(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        phone: _phoneController.text,
      );

      context.read<RegisterCubit>().register(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () => LoadingDialog.show(context: context),
          success: (response) {
            LoadingDialog.hide(context: context);
            showSuccesModal(response.message);
            if (response.data != null) {
              context.router.push(const HomeRoute());
            }
            //

            print(response);
          },
          error: (error) {
                LoadingDialog.hide(context: context);
                showErrorModal(error.type == ApiErrorType.user ? error.error.response.data['message'].toString() : 'erreur de connexion');
            // _showErrorDialog(context, error.message!);
          },
        );
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
                  _buildHeader(context),
                  const Gap.vertical(height: Dimens.tripleSpacing),
                  _buildForm(context),
                  const Gap.vertical(height: Dimens.spacing),
                  _buildTermsCheckbox(context),
                  _buildSubmitButton(context),
                   gapH20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(I18n.of(context).haveAccount,
                          style: context.textTheme.bodySmall!.copyWith(fontSize: 15, color: context.colorScheme.onTertiaryContainer)),
                      gapW4,
                      InkWell(
                        onTap: () {
                          context.router.push(const LoginRoute());
                        },
                        child: Text(I18n.of(context).signIn,
                            style: context.textTheme.bodySmall!.copyWith(fontSize: 16, color: context.colorScheme.primaryContainer)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  // Header section
  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          I18n.of(context).createAccount,
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge,
        ),
        const Gap.vertical(height: Dimens.minSpacing),
        Text(
          I18n.of(context).fillYourInformation,
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
        ),
      ],
    );
  }

  // Form section
  Widget _buildForm(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField(context,
                label: I18n.of(context).nameLabel,
                hint: I18n.of(context).namelHint,
                controller: _nameController,
                validator: (value) => InputValidator.simpleValidator(context, value)
              ),
            const Gap.vertical(height: Dimens.spacing),
            numberWidget,
            const Gap.vertical(height: Dimens.spacing),
            _buildInputField(
              context,
              label: I18n.of(context).login_emailLabel,
              hint: I18n.of(context).mailExple,
              controller: _emailController,
              validator: (value) => InputValidator.emailValidator(context, value),
            ),
            const Gap.vertical(height: Dimens.spacing),
            _buildPasswordField(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
    BuildContext context, {
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
        ),
        Input(
          controller: controller,
          hintText: hint,
          textInputAction: TextInputAction.next,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Column(
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
          validator: (value) => InputValidator.passwordValidator(context, value),
          suffixIcon: IconButton(
            onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
            icon: Icon(
              _isPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  // Terms and conditions checkbox
  Widget _buildTermsCheckbox(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) => setState(() => _isChecked = value!),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${I18n.of(context).agreeWith} ',
                  style: context.textTheme.bodySmall,
                ),
                TextSpan(
                  text: I18n.of(context).termsCondition,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Submit button
  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _isChecked ? () => _onRegister(context) : null,
      child: Text(I18n.of(context).signUp),
    );
  }
    Widget get numberWidget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            I18n.of(context).phone_number,
          style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
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
                  textInputAction: TextInputAction.next,
                ),
              )
            ],
          ),
        ],
      );

}
