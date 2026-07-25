import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,

          decoration: InputDecoration(
            hintText: hint,

            prefixIcon: Icon(prefixIcon),

            suffixIcon: suffixIcon,

            contentPadding: const EdgeInsets.symmetric(vertical: 20),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ],
    );
  }
}
