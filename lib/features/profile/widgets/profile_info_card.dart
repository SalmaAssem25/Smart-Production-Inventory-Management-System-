import 'package:flutter/material.dart';
import '../profile_controller.dart';

class ProfileInfoCard extends StatelessWidget {
  final ProfileController controller;

  const ProfileInfoCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text("Email"),
              subtitle: Text(controller.email),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.badge),
              title: const Text("Employee ID"),
              subtitle: Text(controller.employeeId),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.factory),
              title: const Text("Department"),
              subtitle: Text(controller.department),
            ),
          ],
        ),
      ),
    );
  }
}
