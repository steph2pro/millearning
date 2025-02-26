import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/features/auth/login/ui/login_screen.dart';
import 'package:millearnia/src/features/auth/profile/ui/profile_screen.dart';
import 'package:millearnia/src/features/auth/register/ui/code_verify_screen.dart';
import 'package:millearnia/src/features/auth/register/ui/new_password.dart';
import 'package:millearnia/src/features/auth/register/ui/password_forget_screen.dart';
import 'package:millearnia/src/features/auth/register/ui/register_screen.dart';
import 'package:millearnia/src/features/auth/register/ui/password_wrapper_screen.dart';
import 'package:millearnia/src/features/course/ui/course_screen.dart';
import 'package:millearnia/src/features/cv/ui/choix_model_screen.dart';
import 'package:millearnia/src/features/cv/ui/cv_bluilder_screen.dart';
import 'package:millearnia/src/features/cv/ui/cv_model_screen.dart';
import 'package:millearnia/src/features/cv/ui/cv_model2_screen.dart';
import 'package:millearnia/src/features/cv/ui/cv_model3_screen.dart';
import 'package:millearnia/src/features/centre_interet/ui/centre_interet_screen.dart';
import 'package:millearnia/src/features/course/ui/course_detail_screen.dart';
import 'package:millearnia/src/features/home/ui/home_page_screen.dart';
import 'package:millearnia/src/features/home/ui/home_screen.dart';
import 'package:millearnia/src/features/home/ui/video_player_screen.dart';
import 'package:millearnia/src/features/onboarding/ui/onboarding_screen.dart';
import 'package:millearnia/src/features/professions/ui/professions_detail.dart';
import 'package:millearnia/src/features/professions/ui/professions_screen.dart';
import 'package:millearnia/src/features/splash/ui/splash_screen.dart';
import 'package:millearnia/src/features/welcome/ui/welcome_screen.dart';
import 'package:millearnia/src/features/auth/register/model/otp_code/otp_code_response.dart';
import 'package:millearnia/src/features/home/models/profession.dart';
import 'package:millearnia/src/datasource/models/course.dart';

part 'app_router.gr.dart'; 
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: CentreInteretRoute.page),
    AutoRoute(page: HomePageRoute.page),
    AutoRoute(page: ChoixModelRoute.page),
    AutoRoute(page: CvBuilderRoute.page),
    AutoRoute(page: CvModelRoute.page ),
    AutoRoute(page: CvModel2Route.page),
    AutoRoute(page: CvModel3Route.page),
    AutoRoute(page: VideoPlayerRoute.page),
    AutoRoute(page: ProfessionsRoute.page),
    AutoRoute(page: CourseRoute.page),
    AutoRoute(page: ProfessionsDetailRoute.page),

    AutoRoute(page: PasswordWrapperRoute.page,children: [
      AutoRoute(page: PasswordForgetRoute.page, initial: true),
      AutoRoute(page: CodeVerifyRoute.page),
      AutoRoute(page: NewPasswordRoute.page),

    ]),

    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: CourseDetailRoute.page),
  ];
}
