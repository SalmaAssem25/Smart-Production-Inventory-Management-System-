import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final String supervisorName;

  const DashboardHeader({super.key, required this.supervisorName});

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${getGreeting()}, $supervisorName 👋",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        Text(
          "Production Dashboard",
          style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
        ),

        const SizedBox(height: 4),

        Text(
          "Today • ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
