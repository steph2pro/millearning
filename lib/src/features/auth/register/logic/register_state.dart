part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState.initial({
    required UserModel user
  }) = _Initial;

  factory RegisterState.loading({
     required UserModel user,
  }) = _Loading;

  factory RegisterState.error({
     required UserModel user,
    required ApiError error,
  }) = _Error;

  factory RegisterState.success({
     required UserModel user,
    required Object response,
  }) = _Success;
  const factory RegisterState.updated({required UserModel user}) = _Updated;
}

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:millearnia/gen/assets.gen.dart';
// import 'package:millearnia/src/core/i18n/l10n.dart';
// import 'package:millearnia/src/core/theme/app_size.dart';
// import 'package:millearnia/src/core/theme/dimens.dart';
// import 'package:millearnia/src/shared/components/atoms/dividers/labeled_divider.dart';
// import 'package:millearnia/src/shared/components/forms/input.dart';
// import 'package:millearnia/src/shared/components/gap.dart';
// import 'package:millearnia/src/shared/extensions/context_extensions.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';

// import 'package:millearnia/src/core/routing/app_router.dart'; // Importez le fichier principal // Import de la page cible

// @RoutePage()
// class RegisterScreen extends StatefulWidget{
// // class RegisterScreen extends StatefulWidget implements AutoRouteWrapper {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();

//   // @override
//   // Widget wrappedRoute(BuildContext context) {
//   //   return BlocProvider(
//   //     create: (_) => RegisterCubit(),
//   //     child: this,
//   //   );
//   // }
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool _isChecked = false;
//   bool _isPasswordVisible = false;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//     //BlocListener<RegisterCubit, RegisterState>(
//     //   listener: (context, state) {
//     //     state.whenOrNull(
//     //         loading: (email, password) => LoadingDialog.show(context: context),
//     //         success: (email, password, response) => LoadingDialog.hide(context: context),
//     //         error: (email, password, error) => LoadingDialog.hide(context: context));
//     //   },
//       // child:
//        Scaffold(
//         backgroundColor: context.colorScheme.onPrimary,
//         appBar: AppBar(toolbarHeight: 0),
//         body: SafeArea(
          
//           child: ListView(
//             padding: const EdgeInsets.all(Dimens.spacing),
//             children: [
//               const Gap.vertical(height: Dimens.tripleSpacing),
//               Text(
//                 I18n.of(context).createAccount,
//                 textAlign: TextAlign.center,
//                 style: context.textTheme.bodyLarge,
//               ),
//               const Gap.vertical(height: Dimens.minSpacing),
//               Text(
//                 I18n.of(context).fillYourInformation, 
//                 textAlign: TextAlign.center,
//                 style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
//                 ),
//               const Gap.vertical(height: Dimens.tripleSpacing),
//               AutofillGroup(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         I18n.of(context).nameLabel,
//                         style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
//                       ),
//                       Input(
//                         autofillHints: const [AutofillHints.name],
//                         controller: _nameController,
//                         hintText: I18n.of(context).namelHint,
//                         // onChanged: context.read<RegisterCubit>().oNameChanged,
//                         textInputAction: TextInputAction.next,
//                       ),
//                       const Gap.vertical(height: Dimens.spacing),
//                       Text(
//                         I18n.of(context).login_emailLabel,
//                         style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
//                       ),
//                       Input(
//                         autofillHints: const [AutofillHints.email],
//                         controller: _emailController,
//                         hintText: I18n.of(context).mailExple,
//                         // onChanged: context.read<RegisterCubit>().onEmailChanged,
//                         textInputAction: TextInputAction.next,
//                       ),
//                       const Gap.vertical(height: Dimens.spacing),
                      
//                       Text(
//                         I18n.of(context).login_passwordLabel,
//                         style: context.textTheme.bodySmall?.copyWith(fontSize: 12)
//                       ),
//                       Input(
//                         autofillHints: const [AutofillHints.password],
//                         controller: _passwordController,
//                         isPassword: !_isPasswordVisible,
//                         hintText: I18n.of(context).login_passwordHint,
//                         // onChanged: context.read<RegisterCubit>().onPasswordChanged,
//                         textInputAction: TextInputAction.done,
//                         suffixIcon: IconButton(
//                           onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
//                           icon: Icon(
//                             _isPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
//                             color: context.colorScheme.onSurface,
//                           ),
//                         ),
//                         // onSubmitted: (_) => _onRegister(),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               gapH6,
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
                
//                 children: [
//                   Checkbox(
                    
//                     value: _isChecked,
//                     onChanged: (value) {
//                       setState(() {
//                         _isChecked = value!;
//                       });
//                     },
//                   ),
//                   Expanded(
//                     child: RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: '${I18n.of(context).agreeWith} ', // Texte traduit
//                             style: context.textTheme.bodySmall,
//                           ),
//                           TextSpan(
//                             text: I18n.of(context).termsCondition, // Texte traduit
//                             style: context.textTheme.bodySmall?.copyWith(
//                                 color: context.colorScheme.primary,
//                                 ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               gapH20,
//               ElevatedButton(
//                 onPressed: _isChecked
//                     ? () {
//                         context.router.push(CodeVerifyRoute());
//                       }
//                     : null,
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 47),
//                   alignment: Alignment.center,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       I18n.of(context).signUp, // Texte traduit
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//               const Gap.vertical(height: Dimens.tripleSpacing),
//               Padding(padding: EdgeInsets.symmetric(horizontal: 40),
//               child: LabeledDivider(
//                 labelBackgroundColor: context.colorScheme.onPrimary,
//                 label: I18n.of(context).orSign,
//                 labelPadding: EdgeInsets.all(8),
//               )
//               ),
//               const Gap.vertical(height: Dimens.tripleSpacing),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                    Container(
//                     width: 60,
//                     height: 54,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: context.colorScheme.primary.withOpacity(0.3), width: 1.0), // Bordure bleue
//                       ),
//                     child: IconButton(onPressed: (){}, 
//                     icon: SvgPicture.asset(
//                       Assets.images.appleLogo,
//                       width: Dimens.iconSize,
//                       height: Dimens.iconSize,
//                       ),
//                     ),
//                   ),
//                   gapW12,
//                   Container(
//                     width: 60,
//                     height: 54,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: context.colorScheme.primary, width: 1.0), // Bordure bleue
//                       ),
//                     child: IconButton(onPressed: (){}, 
//                     icon: SvgPicture.asset(
//                       Assets.images.googleLogo,
//                       width: Dimens.iconSize,
//                       height: Dimens.iconSize,
//                       ),
//                     ),
//                   ),
//                   gapW12,
//                   Container(
//                     width: 60,
//                     height: 54,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: context.colorScheme.primary, width: 1.0), // Bordure bleue
//                       ),
//                     child: IconButton(onPressed: (){}, 
//                     icon: Icon(Icons.facebook, color: context.colorScheme.primary,size: Dimens.iconSize,)
//                     // SvgPicture.asset(
//                     //   Assets.images.googleLogo,
//                     //   width: Dimens.iconSize,
//                     //   height: Dimens.iconSize,
//                     //   ),
//                     ),
//                   ),
                 
//                 ],
//               ),
//               gapH20,
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                   I18n.of(context).alreadyHave,
//                   style: context.textTheme.bodySmall!.copyWith(fontSize: 15,color: context.colorScheme.onTertiaryContainer)
//                   ),
//                   gapW4,
//                   InkWell(
//                     onTap: (){
//                       context.router.push(const LoginRoute());
//                     }, 
//                     child: Text(
//                       I18n.of(context).signIn,
//                       style: context.textTheme.bodySmall!.copyWith(fontSize: 16,color: context.colorScheme.primaryContainer)
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
       
//       );
//     // );
//   }

//   // void _onRegister() => context.read<RegisterCubit>().Register();
// }
