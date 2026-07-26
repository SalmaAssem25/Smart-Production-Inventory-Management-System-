import 'package:flutter/material.dart';
import '../../dashboard/dashboard_screen.dart';

class LoginController {
  final BuildContext context;

  LoginController(this.context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  void togglePassword() {
    obscurePassword = !obscurePassword;
  }

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
    );
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
