import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final String title;

  const ActivityTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.check)),
        title: Text(title),
        subtitle: const Text("Just now"),
      ),
    );
  }
}
