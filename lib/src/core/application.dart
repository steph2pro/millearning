import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/core/theme/app_theme.dart';
import 'package:millearnia/src/features/centre_interet/logic/interet_cubit.dart';
import 'package:millearnia/src/features/centre_interet/logic/user_interest_cubit.dart';
import 'package:millearnia/src/features/course/logic/course_userInterest_cubit.dart';
import 'package:millearnia/src/features/course/logic/userCourse_cubit.dart';
import 'package:millearnia/src/features/course/logic/userCourse_enroll_cubit.dart';
import 'package:millearnia/src/features/home/logic/category_cubit.dart';
import 'package:millearnia/src/features/home/logic/profession_cubit.dart';
import 'package:millearnia/src/features/home/logic/course_cubit.dart';
import 'package:millearnia/src/features/professions/logic/profession_userInterest_cubit.dart';
import 'package:millearnia/src/shared/locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
class Application extends StatelessWidget {
  final AppRouter _appRouter;

  Application({
    super.key,
    AppRouter? appRouter,
  }) : _appRouter = appRouter ?? locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfessionCubit()), 
        BlocProvider(create: (context) => ProfessionUserInterestCubit()),
        BlocProvider(create: (context) => CourseCubit()), 
        BlocProvider(create: (context) => CourseUserInterestCubit()), 
        BlocProvider(create: (context) => UserCourseEnrollCubit()), 
        BlocProvider(create: (context) => UserCourseCubit()),
        BlocProvider(create: (context) => InteretCubit()),
        BlocProvider(create: (context) => UserInteretCubit()),
        BlocProvider(create: (context) => CategoryCubit()..getCategories()), 
      ],
      child: MaterialApp.router(
        title: 'MyApp',
        routerConfig: _appRouter.config(
          navigatorObservers: () => [
            AutoRouteObserver(),
          ],
        ),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          I18n.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: I18n.delegate.supportedLocales,
        builder: (context, child) {
          return OKToast(child: child ?? Container());
        },
      ),
    );
  }
}
