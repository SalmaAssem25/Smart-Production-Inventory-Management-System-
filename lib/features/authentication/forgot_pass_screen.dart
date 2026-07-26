import 'package:flutter/material.dart';

import '../../app/colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void sendResetLink() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Password reset link sent.")));

    // Firebase code will be added later
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Image.asset(
                      //"assets/images/reset_password.png",
                      //height: 180,
                      //fit: BoxFit.contain,
                      //),
                      const Icon(
                        Icons.lock_reset,
                        size: 120,
                        color: AppColors.primary,
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Reset Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Enter your registered email address and we'll send you instructions to reset your password.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 35),

                      const Text(
                        "Email Address",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      CustomTextField(
                        controller: emailController,
                        label: "",
                        hint: "name@company.com",
                        prefixIcon: Icons.email_outlined,
                      ),

                      const SizedBox(height: 35),

                      CustomButton(
                        title: "Send Reset Link",
                        onPressed: sendResetLink,
                      ),

                      const SizedBox(height: 30),

                      const Divider(),

                      const SizedBox(height: 15),

                      TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text(
                          "Back to Login",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "JSPIMS INDUSTRIAL ECOSYSTEM",
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
