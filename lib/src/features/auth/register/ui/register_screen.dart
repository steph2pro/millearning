import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/gen/assets.gen.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/features/auth/register/model/register_request.dart';
import 'package:millearnia/src/shared/components/dialogs/dialog_builder.dart';
import 'package:millearnia/src/shared/components/dialogs/notifyer.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/gap.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:millearnia/src/features/auth/register/logic/register_cubit.dart';

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
            _hideLoadingDialog(context);
            showSuccesModal(response.message);
            if(response.data!=null){
              context.router.push(const LoginRoute());
            }
            // 

            print (response);
          },
          error: (error) {
            _hideLoadingDialog(context);
            print("je suis error en grand");
            print(error.error);
            print(error);
             showErrorModal(
              error.toString()
             );
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
          child:SafeArea(
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
            ],
          ),
        ),
        )
      ),
    );
  }

  // Header section
  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          I18n.of(context).createAccount,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge,
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
            _buildInputField(
              context,
              label: I18n.of(context).nameLabel,
              hint: I18n.of(context).namelHint,
              controller: _nameController,
              validator: (value)=>InputValidator.simpleValidator(context, value)
            ),
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
          validator: (value)=>InputValidator.passwordValidator(context, value),
          suffixIcon: IconButton(
            onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
            icon: Icon(
              _isPasswordVisible
                  ? IconsaxPlusBroken.eye
                  : IconsaxPlusBroken.eye_slash,
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

  // Helper dialogs
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  void _hideLoadingDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
    print('chargement');
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Erreur'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
