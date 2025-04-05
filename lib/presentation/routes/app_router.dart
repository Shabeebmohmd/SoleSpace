import 'package:flutter/material.dart';
import 'package:sole_space_user/presentation/routes/app_routes.dart';
import 'package:sole_space_user/presentation/screens/auth/recovery_password.dart';
import 'package:sole_space_user/presentation/screens/auth/sign_in.dart';
import 'package:sole_space_user/presentation/screens/auth/sign_up.dart';
import 'package:sole_space_user/presentation/screens/onboarding/pages/onboarding_one.dart';
import 'package:sole_space_user/presentation/screens/splash/pages/splash.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case AppRoutes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInPage());

      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpPage());

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const RecoveryPasswordPage());

      case AppRoutes.onboardingOne:
        return MaterialPageRoute(builder: (_) => const OnboardingOne());

      // Add more routes as needed

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
