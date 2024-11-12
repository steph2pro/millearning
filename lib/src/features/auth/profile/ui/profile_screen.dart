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
class ProfileScreen extends StatefulWidget{
// class ProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

  // @override
  // Widget wrappedRoute(BuildContext context) {
  //   return BlocProvider(
  //     create: (_) => ProfileCubit(),
  //     child: this,
  //   );
  // }
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
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
              gapH16,
              Text(
                I18n.of(context).completeYouProfile,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge,
              ),
              const Gap.vertical(height: Dimens.minSpacing),
              Text(
                I18n.of(context).dontWorry, 
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                ),
              gapH30,
              SizedBox(
                width: 118,
                height: 118,
                child: Image.asset(
                  "assets/images/profile.png",
                  // fit: BoxFit.cover,
                ),
              ),
              gapH16,
              AutofillGroup(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(
                        I18n.of(context).nameLabel,
                        style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                      ),
                      Input(
                        autofillHints: const [AutofillHints.name],
                        controller: _nameController,
                        hintText: I18n.of(context).namelHint,
                        // onChanged: context.read<RegisterCubit>().oNameChanged,
                        textInputAction: TextInputAction.next,
                      ),
                      gapH6,
                      Text(
                        I18n.of(context).phoneNumber,
                        style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                      ),


                      Input(
                        autofillHints: const [AutofillHints.name],
                        controller: _nameController,
                        // hintText: I18n.of(context).namelHint,
                        // onChanged: context.read<RegisterCubit>().oNameChanged,
                        textInputAction: TextInputAction.next,
                      ),
                      gapH6,
                      Text(
                        I18n.of(context).gender,
                        style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                      ),
                    ],
                  ),
                ),
              ),
             
             gapH25,
              Button.primary(
                
                title: I18n.of(context).completeProfile,
                onPressed: (){},
              ),
              
            ],
          ),
        ),
       
      );
    // );
  }

  // void _onRegister() => context.read<RegisterCubit>().Register();
}
