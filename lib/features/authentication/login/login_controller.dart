import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/services/auth_service.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/services/user_service.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  void togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<String> login() async {
    try {
      isLoading = true;
      notifyListeners();

      await AuthService.signIn(
        email: emailController.text,
        password: passwordController.text,
      );

      print("Logged in email: ${FirebaseAuth.instance.currentUser?.email}");
      print("Logged in UID: ${FirebaseAuth.instance.currentUser?.uid}");

      print("===== AFTER SIGN IN =====");

      final user = await UserService.getCurrentUser();

      print("User object: $user");
      print("Name: ${user?.name}");
      print("Role: ${user?.role}");
      print("Department: ${user?.department}");

      print("===== BEFORE SWITCH =====");
      if (user == null) {
        throw Exception("User data not found.");
      }

      return user.role;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
