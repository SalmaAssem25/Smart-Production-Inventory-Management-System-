import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/widgets/custom_button.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/widgets/custom_textfield.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/authentication/forgot_pass_screen.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/authentication/login/login_controller.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;
  final VoidCallback onPasswordToggle;

  const LoginForm({
    super.key,
    required this.controller,
    required this.onPasswordToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: .05), blurRadius: 18),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: controller.emailController,
            label: "Email",
            hint: "manager@jspims.com",
            prefixIcon: Icons.email_outlined,
          ),

          const SizedBox(height: 24),

          CustomTextField(
            controller: controller.passwordController,
            label: "Password",
            hint: "••••••••",
            prefixIcon: Icons.lock_outline,
            obscureText: controller.obscurePassword,
            suffixIcon: IconButton(
              onPressed: onPasswordToggle,
              icon: Icon(
                controller.obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ForgotPasswordScreen(),
                  ),
                );
              },
              child: const Text("Forgot Password?"),
            ),
          ),

          const SizedBox(height: 20),

          CustomButton(
            title: "Login",
            icon: Icons.arrow_forward,
            onPressed: controller.login,
          ),

          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
