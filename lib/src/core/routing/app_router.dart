import 'package:auto_route/auto_route.dart';
import 'package:flutter_kit/src/features/login/ui/login_screen.dart';
import 'package:flutter_kit/src/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter_kit/src/features/splash/ui/splash_screen.dart';
import 'package:flutter_kit/src/features/welcome/ui/welcome_screen.dart';
import 'package:flutter_kit/src/features/user/ui/user_screen.dart';

part 'app_router.gr.dart'; // Assurez-vous que cela est correct

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: OnboardingRoute.page),
  ];
}
