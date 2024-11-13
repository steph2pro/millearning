import 'package:auto_route/auto_route.dart';
import 'package:millearnia/src/features/auth/login/ui/login_screen.dart';
import 'package:millearnia/src/features/auth/profile/ui/profile_screen.dart';
import 'package:millearnia/src/features/auth/register/ui/code_verify_screen.dart';
import 'package:millearnia/src/features/auth/register/ui/new_password.dart';
import 'package:millearnia/src/features/auth/register/ui/register_screen.dart';
import 'package:millearnia/src/features/home/ui/home_screen.dart';
import 'package:millearnia/src/features/onboarding/ui/onboarding_screen.dart';
import 'package:millearnia/src/features/splash/ui/splash_screen.dart';
import 'package:millearnia/src/features/welcome/ui/welcome_screen.dart';
import 'package:millearnia/src/features/user/ui/user_screen.dart';

part 'app_router.gr.dart'; // Assurez-vous que cela est correct

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: CodeVerifyRoute.page),
    AutoRoute(page: NewPasswordRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: HomeRoute.page),
  ];
}
