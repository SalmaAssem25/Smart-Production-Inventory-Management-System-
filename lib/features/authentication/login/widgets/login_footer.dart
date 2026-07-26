import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Industrial Ops OS v4.2",
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {}, child: const Text("Privacy Policy")),

            const Text("•"),

            TextButton(onPressed: () {}, child: const Text("Terms of Service")),
          ],
        ),
      ],
    );
  }
}
