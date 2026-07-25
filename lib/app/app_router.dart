import 'package:flutter/material.dart';
import '../features/authentication/login_screen.dart';
import '../features/splash/splash_screen.dart';
import '../features/authentication/forgot_pass_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
