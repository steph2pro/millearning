import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/core/theme/app_theme.dart';
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
    return MaterialApp.router(
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
    );
  }
}
