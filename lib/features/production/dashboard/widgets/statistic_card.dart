import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon;
  final Color color;

  const StatisticCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: color.withOpacity(.15),
              child: Icon(icon, color: color),
            ),

            Text(
              value.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
