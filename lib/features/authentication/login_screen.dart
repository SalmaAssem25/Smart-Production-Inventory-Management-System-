import 'package:flutter/material.dart';

import '../../app/colors.dart';
import '../../app/constants.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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

              // Logo
              Container(
                width: 130,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    AppConstants.logoPath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              Text(
                "Welcome Back, Factory\nManager",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              const SizedBox(height: 15),

              Text(
                "Please sign in to access the production floor.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: 45),

              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .05),
                      blurRadius: 18,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    const SizedBox(height: 12),

                    CustomTextField(
                      controller: emailController,
                      label: '',
                      hint: "manager@jspims.industrial",
                      prefixIcon: Icons.email_outlined,
                    ),

                    const SizedBox(height: 24),

                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    const SizedBox(height: 12),

                    CustomTextField(
                      controller: passwordController,
                      hint: "••••••••",
                      prefixIcon: Icons.lock_outline,
                      obscureText: obscurePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      label: '',
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          activeColor: AppColors.primary,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),

                        const Text("Remember Me"),

                        const Spacer(),

                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot-password');
                          },
                          child: const Text("Forgot Password?"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    CustomButton(
                      title: "Login",
                      icon: Icons.arrow_forward,
                      onPressed: () {},
                    ),

                    const SizedBox(height: 28),

                    Row(
                      children: [
                        const Expanded(child: Divider()),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "OR CONTINUE WITH",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),

                        const Expanded(child: Divider()),
                      ],
                    ),

                    const SizedBox(height: 28),

                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 65),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.fingerprint),
                      label: const Text(
                        "Biometrics",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 45),

              Text(
                "Industrial Ops OS v4.2",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Privacy Policy"),
                  ),

                  const Text("•"),

                  TextButton(
                    onPressed: () {},
                    child: const Text("Terms of Service"),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
