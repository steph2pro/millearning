import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/features/auth/register/logic/password_forget_cubit.dart';
import 'package:millearnia/src/features/auth/register/model/otp_code/otp_code_request.dart';
import 'package:millearnia/src/shared/components/buttons/button.dart';
import 'package:millearnia/src/shared/components/gap.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:millearnia/src/core/routing/app_router.dart'; // Importez le fichier principal // Import de la page cible

@RoutePage()
class CodeVerifyScreen extends StatefulWidget{
  
  const CodeVerifyScreen({super.key});

  @override
  State<CodeVerifyScreen> createState() => _CodeVerifyScreenState();


}

class _CodeVerifyScreenState extends State<CodeVerifyScreen> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _otpCode = "";
  

  @override
  Widget build(BuildContext context) {
    return 
    
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
                I18n.of(context).verifyCode,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge,
              ),
              const Gap.vertical(height: Dimens.minSpacing),
              Text(
                I18n.of(context).enterCode, 
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                ),
              Text(
                I18n.of(context).mailExple, 
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(fontSize: 12, color: context.colorScheme.primary)
                ),
              gapH30,
              
              OtpTextField(
                numberOfFields: 4,
                // borderColor: context.colorScheme.secondary,
                borderWidth: 2,
                showFieldAsBox: true,
                fieldWidth: 51,
                fieldHeight: 41,filled: true, // Ajoute le remplissage de fond
                fillColor: context.colorScheme.onSurfaceVariant,
                borderRadius: BorderRadius.circular(10),
                textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize:12,color: context.colorScheme.onSecondaryContainer),
                enabledBorderColor: Colors.transparent,
                focusedBorderColor: context.colorScheme.primary,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                   setState(() {
                  _otpCode = verificationCode; // Store the OTP code
                });
                },
              ),
              gapH32,
                Text(
                I18n.of(context).didReceive, 
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                ), 
                gapH4,
                TextButton(
                    onPressed: (){
                      context.router.push(const LoginRoute());
                    }, 
                    child: Text(
                      I18n.of(context).resendCode,
                      style: context.textTheme.bodySmall!.copyWith(fontSize: 12,color: context.colorScheme.tertiary)
                    ),
                  ),
              gapH25,
              Button.primary(
                
                title: I18n.of(context).verify,
                onPressed: (){
                  print("Entered OTP: $_otpCode");
                  final otpCode=OtpCodeRequest(otpCode: _otpCode);
                  if (_otpCode != '') {
                      context.read<PasswordForgetCubit>().sendOtpCode(otpCode);
                    }
                },
              ),
              
            ],
          ),
        ),
       
      );
    // );
  }

}
