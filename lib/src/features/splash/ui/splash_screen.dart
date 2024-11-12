import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:millearnia/gen/assets.gen.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';



@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Hide screen status bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
    Future.delayed(const Duration(seconds: 3),
        () => context.pushRoute(const WelcomeRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Image.asset(
            "assets/images/logo.png",
            width: 62,
            height: 60,
          ),
        
          gapH16,
          Center(
            child: Text(
              "Millearnia",
              style: context.textTheme.bodyLarge
            ),
          )
        ],
      ),
    );
  }
}
