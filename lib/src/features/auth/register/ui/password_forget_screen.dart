import 'package:auto_route/auto_route.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/features/auth/register/logic/password_forget_cubit.dart';
import 'package:millearnia/src/features/auth/register/model/identify/identify_request.dart';
import 'package:millearnia/src/shared/components/buttons/button.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/gap.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/shared/utils/regexp_plus.dart';
import 'package:millearnia/src/shared/utils/utils.dart'; // Importez le fichier principal // Import de la page cible

@RoutePage()
class PasswordForgetScreen extends StatefulWidget{
  const PasswordForgetScreen({super.key});

  @override
  State<PasswordForgetScreen> createState() => _PasswordForgetScreenState();

}

class _PasswordForgetScreenState extends State<PasswordForgetScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    
  final TextEditingController _emailController = TextEditingController();

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
   String removeSpaces(String input) {
    return input.replaceAll(' ', '');
  }

  @override
  void dispose() {
    _emailController.dispose();
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
                // I18n.of(context).newPassword,
                'Forget password',
                textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge,
              ),
              const Gap.vertical(height: Dimens.minSpacing),
              Text(
                // I18n.of(context).youNewPassword, 
                'Forgot your password? No inquire, enter your email and renew it',
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
                      isPhoneNumber ? numberWidget : emailWidget,
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
                                  '${I18n.of(context).recoverWith} : ${!isPhoneNumber ? I18n.of(context).phone_number.toLowerCase() : I18n.of(context).login_emailLabel.toLowerCase()}'),
                            ),
                          ),
                    ],
                  ),
                ),
              ),
             
             gapH25,
              Button.primary(
                
                title:  I18n.of(context).continu,
                onPressed: (){
                   final identifyRequest=IdentifyRequest(
                    email: _emailController.text ,
                    phone: removeSpaces('+${_country.phoneCode}${_phoneController.text}'),
                   );
                   print(identifyRequest.phone);
                  if (_formKey.currentState!.validate()) {
                      context.read<PasswordForgetCubit>().sendIdentify(identifyRequest);
                    }
                },
              ),
              
            ],
          ),
        ),
       
      );
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
}

