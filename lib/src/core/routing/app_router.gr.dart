// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CodeVerifyScreen]
class CodeVerifyRoute extends PageRouteInfo<void> {
  const CodeVerifyRoute({List<PageRouteInfo>? children})
      : super(
          CodeVerifyRoute.name,
          initialChildren: children,
        );

  static const String name = 'CodeVerifyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CodeVerifyScreen();
    },
  );
}

/// generated route for
/// [CourseDetailScreen]
class CourseDetailRoute extends PageRouteInfo<void> {
  const CourseDetailRoute({List<PageRouteInfo>? children})
      : super(
          CourseDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CourseDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CourseDetailScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const LoginScreen());
    },
  );
}

/// generated route for
/// [NewPasswordScreen]
class NewPasswordRoute extends PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    Key? key,
    required OtpCodeResponse otpCodeResponse,
    List<PageRouteInfo>? children,
  }) : super(
          NewPasswordRoute.name,
          args: NewPasswordRouteArgs(
            key: key,
            otpCodeResponse: otpCodeResponse,
          ),
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewPasswordRouteArgs>();
      return NewPasswordScreen(
        key: args.key,
        otpCodeResponse: args.otpCodeResponse,
      );
    },
  );
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({
    this.key,
    required this.otpCodeResponse,
  });

  final Key? key;

  final OtpCodeResponse otpCodeResponse;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{key: $key, otpCodeResponse: $otpCodeResponse}';
  }
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
    },
  );
}

/// generated route for
/// [PasswordForgetScreen]
class PasswordForgetRoute extends PageRouteInfo<void> {
  const PasswordForgetRoute({List<PageRouteInfo>? children})
      : super(
          PasswordForgetRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordForgetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PasswordForgetScreen();
    },
  );
}

/// generated route for
/// [PasswordWrapperScreen]
class PasswordWrapperRoute extends PageRouteInfo<void> {
  const PasswordWrapperRoute({List<PageRouteInfo>? children})
      : super(
          PasswordWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordWrapperRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const PasswordWrapperScreen());
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const RegisterScreen());
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomeScreen();
    },
  );
}
