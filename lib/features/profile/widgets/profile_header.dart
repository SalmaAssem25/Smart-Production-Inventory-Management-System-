import 'package:flutter/material.dart';
import '../profile_controller.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileController controller;

  const ProfileHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),

        const SizedBox(height: 16),

        Text(
          controller.fullName,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        Text(controller.role, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }
}
