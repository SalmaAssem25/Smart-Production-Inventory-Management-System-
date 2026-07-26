import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/app/constants.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            child: Image.asset(AppConstants.logoPath, fit: BoxFit.contain),
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
      ],
    );
  }
}
