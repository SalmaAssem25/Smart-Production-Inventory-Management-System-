import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/services/auth_service.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/home/main_navigation.dart';
import '../../dashboard/dashboard_screen.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/services/user_service.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/dashboard/production_dashboard_screen.dart';

class LoginController extends ChangeNotifier {
  final BuildContext context;

  LoginController(this.context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  void togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> login() async {
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

      switch (user.role) {
        case 'Production Supervisor':
          print(">>>>>>>> Opening Production Dashboard <<<<<<<<");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MainNavigation()),
          );
          break;

        case 'Warehouse Staff':
          // TODO: Replace with WarehouseDashboardScreen when created
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const DashboardScreen()),
          );
          break;

        case 'Manager':
          // TODO: Replace with ManagerDashboardScreen when created
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const DashboardScreen()),
          );
          break;

        default:
          throw Exception("Unknown user role: ${user.role}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
