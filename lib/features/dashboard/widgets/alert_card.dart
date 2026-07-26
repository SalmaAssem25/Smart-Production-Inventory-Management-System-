import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  final String title;

  const AlertCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.orange.shade50,
      child: ListTile(
        leading: const Icon(Icons.warning_amber_rounded, color: Colors.orange),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
