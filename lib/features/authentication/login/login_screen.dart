import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/app/colors.dart';

import 'login_controller.dart';
import 'widgets/login_header.dart';
import 'widgets/login_form.dart';
import 'widgets/login_footer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = LoginController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 30),

              /// Header
              const LoginHeader(),

              const SizedBox(height: 45),

              /// Form
              LoginForm(
                controller: controller,
                onPasswordToggle: () {
                  setState(() {
                    controller.togglePassword();
                  });
                },
              ),

              const SizedBox(height: 45),

              /// Footer
              const LoginFooter(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
