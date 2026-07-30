import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/services/auth_service.dart';

class ProfileController extends ChangeNotifier {
  bool isLoading = false;

  // Temporary data until Firebase is connected
  String fullName = "Salma Sherif";
  String email = "salma@gmail.com";
  String role = "Production Supervisor";
  String employeeId = "EMP001";
  String department = "Production";

  Future<void> logout() async {
    await AuthService.signOut();
  }
}
