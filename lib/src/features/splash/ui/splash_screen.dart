import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/routing/app_router.dart';
import 'package:flutter_kit/src/core/theme/app_size.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_kit/gen/assets.gen.dart';
import 'package:flutter_kit/src/core/theme/dimens.dart';
import 'package:flutter_kit/src/shared/extensions/context_extensions.dart';



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
              "ParcoursVision",
              style: context.textTheme.bodyLarge
            ),
          )
        ],
      ),
    );
  }
}
