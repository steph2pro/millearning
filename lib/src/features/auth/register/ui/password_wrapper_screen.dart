import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/features/auth/register/logic/password_forget_cubit.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';
import 'package:millearnia/src/shared/utils/send_otp.dart';
import 'package:oktoast/oktoast.dart';

import '../../../../core/i18n/l10n.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../shared/components/dialogs/dialog_builder.dart';

@RoutePage()
class PasswordWrapperScreen extends StatefulWidget implements AutoRouteWrapper {
  const PasswordWrapperScreen({super.key});

  @override
  State<PasswordWrapperScreen> createState() => _PasswordWrapperScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (context) => PasswordForgetCubit(), child: this);
  }
 
  
}

Future<void> sendOtp(String phoneNumber) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('Utilisateur connecté avec succès');
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        print('UID utilisateur 1 : ${user.uid}');
      }
    },
    verificationFailed: (FirebaseAuthException e) {
      print('Erreur lors de la vérification : ${e.message}');
    },
    codeSent: (String verificationId, int? resendToken) async {
      print('Code envoyé : $verificationId');
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      print('Timeout : $verificationId');
    },
  );
}
// void sendOtp(String? phone){
//   authWithPhoneNumber(
//     phone, 
//     onCodeSend: (verificationId, v){
//       // setState((){});
//       print('code send succesful');
//     }, 
//     onAutoVerify: (v){
//       print('sign-in');
//     },
//     onFailed: (e){
//       print('le code est erronner $e');
//     }, 
//     autoRetrieval: (v){}
//     );

// }
// void createUserAndSendOTP(String? phone) async {
//   try {
//     if (phone == null || phone.isEmpty) {
//       throw Exception("Le numéro de téléphone est requis.");
//     }

//     // Étape 1 : Créer un utilisateur anonyme
//     UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
//     User? user = userCredential.user;

//     if (user == null) {
//       throw Exception("Impossible de créer un utilisateur.");
//     }

//     print("Utilisateur anonyme créé avec succès !");
//     print("UID de l'utilisateur : ${user.uid}");

//     // Étape 2 : Envoyer l'OTP pour vérifier le numéro
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phone,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         // Si la vérification est automatiquement réussie
//         await user.linkWithCredential(credential); // Associer le numéro au compte existant
//         print("Numéro de téléphone associé avec succès !");
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         // Gestion des erreurs
//         if (e.code == 'invalid-phone-number') {
//           print("Le numéro de téléphone est invalide.");
//         } else {
//           print("Échec de la vérification : ${e.message}");
//         }
//       },
//       codeSent: (String verificationId, int? resendToken) async {
//         // Lorsque l'OTP est envoyé
//         print("OTP envoyé avec succès !");
//         // Simulation de l'entrée de l'OTP par l'utilisateur (remplacez par votre logique)
//         String smsCode = await getSMSCodeFromUser();

//         // Associer le numéro de téléphone une fois l'OTP validé
//         PhoneAuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verificationId,
//           smsCode: smsCode,
//         );

//         await user.linkWithCredential(credential); // Associer le numéro au compte
//         print("Numéro de téléphone associé avec succès après validation !");
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         print("Délai d'attente dépassé pour la récupération automatique du code.");
//       },
//     );
//   } catch (e) {
//     print("Erreur : $e");
//   }
// }

// // Remplacez cette méthode par votre propre logique pour demander l'OTP
// Future<String> getSMSCodeFromUser() async {
//   print("Veuillez entrer le code OTP :");
//   await Future.delayed(Duration(seconds: 5)); // Simule un délai pour l'entrée utilisateur
//   return "123456"; // Remplacez par le code saisi par l'utilisateur
// }

 
class _PasswordWrapperScreenState extends State<PasswordWrapperScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordForgetCubit, PasswordForgetState>(
        listenWhen: (previous, current) {
          final isRestoringState = previous.whenOrNull(error: (prev, error) => true) ?? false;
          return !isRestoringState;
        },
        listener: (context, state) {
          state.whenOrNull(
              loading: () => LoadingDialog.show(context: context),
              successIdentify: (data) {
                LoadingDialog.hide(context: context);
                context.pushRoute(const CodeVerifyRoute());
              },
              successIdentifyPhone:(data){
                LoadingDialog.hide(context: context);
                // on envoie l'otp avant de passer a la page suivante
                print('sending OTP');
                sendOtp(data.phone!);
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  print('UID utilisateur : ${user.uid}');
                }

              },
              successOtpCodeVerify: (data) {
                LoadingDialog.hide(context: context);
                context.pushRoute( NewPasswordRoute(otpCodeResponse: data));
              },
              successNewPassword: (data) {
                LoadingDialog.hide(context: context);
                showSuccesModal(data.message);

                context.pushRoute(const LoginRoute());
              },
              // done: (data) {
              //   SharedPrefService.setUserConnection(data);
              //   RequestUtils.secretToken = data.tkn;
              //   RequestUtils.deviceId = data.device;
              //   RequestUtils.kid = data.user.kid;
              //   context.replaceRoute(const AppWrapperRoute());
              // },
              // successSetPassword: (data) {
              //   LoadingDialog.hide(context: context);
              //   context.pushRoute(SignInPasswordRoute(userConnection: data));
              // },
              error: (s, error) {
                LoadingDialog.hide(context: context);
                showErrorModal(error.type == ApiErrorType.user ? error.error.response.data['message'].toString() : 'erreur de connexion');

              });
        },
        child: const AutoRouter());
  }
}