import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';



@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Hide screen status bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
    // Future.delayed(const Duration(seconds: 3),
    //     () => context.pushRoute(const OnboardingRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      backgroundColor: context.colorScheme.onPrimary,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Container(
      width: double.infinity,
      height: 400,
      child: ClipPath(
        clipper: CurvedClipper(),
        child: Image.asset(
          "assets/images/welcome.png",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    ),
          gapH16,
         Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                gapH10,
                 RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:  '${I18n.of(context).findingThe} ', // Texte traduit
                          style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700)
                          ),
                      TextSpan(
                          text: I18n.of(context).perfect, // Texte traduit
                          style: context.textTheme.bodyLarge!.copyWith(color: context.colorScheme.secondary,fontWeight: FontWeight.w700)
                        ),
                        TextSpan(
                          text: ' ${I18n.of(context).forYou}', // Texte traduit
                          style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700)
                        ),
                    ],
                  ),
                ),
                gapH18,
                Text(
                  textAlign: TextAlign.center,
                  I18n.of(context).appTo,
                  style: context.textTheme.bodySmall
                ),
                gapH16,
             SizedBox(
              width: double.infinity,
              child:  ElevatedButton(
                onPressed: (){
                  context.router.push(const OnboardingRoute());
                }, 
                child: Text(
                  I18n.of(context).letStarted,
                  style: context.textTheme.bodySmall!.copyWith(color: context.colorScheme.onPrimary,fontSize: 15)
                ),
              ),
             ),
             gapH20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  I18n.of(context).alreadyHave,
                  style: context.textTheme.bodySmall!.copyWith(fontSize: 15,color: context.colorScheme.onTertiaryContainer)
                  ),
                  TextButton(
                    onPressed: (){
                      context.router.push(const LoginRoute());
                    }, 
                    child: Text(
                      I18n.of(context).signIn,
                      style: context.textTheme.bodySmall!.copyWith(fontSize: 16,color: context.colorScheme.primaryContainer)
                    ),
                  )
                ],
              )

              ],
            ),
            )
         )              
        ],
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 4, size.height);
   path.quadraticBezierTo(3 * size.width / 2, size.height, size.width, size.height - 120);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
