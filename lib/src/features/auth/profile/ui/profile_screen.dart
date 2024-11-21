import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/features/auth/profile/logic/image_controller.dart';
import 'package:millearnia/src/shared/components/buttons/button.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/gap.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:country_picker/country_picker.dart' hide Country;
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart' as cps;

import 'package:millearnia/src/shared/utils/utils.dart';
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
    final ImagePickerController _controller = ImagePickerController();
    Country _selectedCountry = cps.CountryPickerUtils.getCountryByIsoCode('cm');
    final List<String> options = ['Male', 'Femmele'];
    String? selectedOption;
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final phoneController = useTextEditingController();
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
          Center(
      child: Stack(
        children: [
          Container(
            width: 118,
            height: 118,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
              backgroundImage: _controller.selectedImage != null ? FileImage(_controller.selectedImage!) : null,
              child: _controller.selectedImage == null
                  ? Icon(
                      Icons.person,
                      size: 100,
                      color: Theme.of(context).colorScheme.tertiary,
                    )
                  : null,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: IconButton(
                icon: Icon(
                  _controller.selectedImage == null ? Icons.edit : Icons.check,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 20,
                ),
                onPressed: () async {
                  await _controller.pickImage();
                  setState(() {});
                  print("object");
                },
              ),
            ),
          ),
        ],
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

                      TextFormField(
                                  controller: _phoneController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please provide phone number";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    prefixIcon: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.only(left: 16),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            width: 1,
                                            // color: AppColors.inputBorderColor,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showCountryPicker(
                                                context: context,
                                                showPhoneCode: true,
                                                useRootNavigator: true,
                                                useSafeArea: true,
                                                onSelect: (country) {
                                                  if (_selectedCountry
                                                          .isoCode !=
                                                      country.countryCode) {
                                                    setState(() {
                                                      _selectedCountry = cps
                                                              .CountryPickerUtils
                                                          .getCountryByPhoneCode(
                                                              country
                                                                  .phoneCode);
                                                    });
                                                  }
                                                },
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  Utils.isoToEmoji(
                                                      _selectedCountry.isoCode),
                                                  style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                                                ),
                                                const Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 16,
                                                )
                                              ],
                                            ),
                                          ),
                                          Text(
                                            _selectedCountry.phoneCode,
                                            style:context.textTheme.bodySmall?.copyWith(fontSize: 12)
                                          ),
                                          gapW6,
                                        ],
                                      ),
                                    ),
                                    hintText: I18n.of(context).EnterPhoneNumber,
                                  ),
                                ),


                      gapH6,
                      Text(
                        I18n.of(context).gender,
                        style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
                      ),
                      Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurfaceVariant, // Fond gris
                        borderRadius: BorderRadius.circular(10), // Bordures arrondies
                      ),
                      child: DropdownButton<String>(
                        value: selectedOption,
                        hint: Text('Select'),
                        isExpanded: true,
                        underline: SizedBox(), // Supprime la ligne soulignée
                        icon: Icon(Icons.arrow_drop_down),
                        items: options.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOption = newValue;
                          });
                        },
                      ),
                    ),
      
                    ],
                  ),
                ),
              ),
             
             gapH25,
              Button.primary(
                
                title: I18n.of(context).completeProfile,
                onPressed: (){
                  context.router.push(HomeRoute());
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
