import 'package:auto_route/auto_route.dart';
import 'package:flutter_kit/src/features/login/ui/login_screen.dart';
import 'package:flutter_kit/src/features/user/ui/user_screen.dart'; // Import de la nouvelle page

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: LoginRoute.page), // Route pour la page Login
    AutoRoute(page: UserRoute.page, initial: true), // Nouvelle route pour UserScreen
  ];
}
