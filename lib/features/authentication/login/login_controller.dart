import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  void togglePassword() {
    obscurePassword = !obscurePassword;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
