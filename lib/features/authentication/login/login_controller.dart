import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/services/auth_service.dart';
import '../../dashboard/dashboard_screen.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/services/user_service.dart';

class LoginController {
  final BuildContext context;

  LoginController(this.context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  void togglePassword() {
    obscurePassword = !obscurePassword;
  }

  Future<void> login() async {
    try {
      await AuthService.signIn(
        email: emailController.text,
        password: passwordController.text,
      );

      final user = await UserService.getCurrentUser();
      print("Name: ${user?.name}");
      print("Role: ${user?.role}");
      print("Department: ${user?.department}");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
