import 'package:flutter/material.dart';

import 'statistic_card.dart';

class StatisticsGrid extends StatelessWidget {
  final int total;
  final int planned;
  final int running;
  final int completed;

  const StatisticsGrid({
    super.key,
    required this.total,
    required this.planned,
    required this.running,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 14,
      crossAxisSpacing: 14,
      childAspectRatio: 1.05,

      children: [
        StatisticCard(
          title: "Total",
          value: total,
          icon: Icons.inventory_2,
          color: Colors.blue,
        ),

        StatisticCard(
          title: "Running",
          value: running,
          icon: Icons.play_circle_fill,
          color: Colors.green,
        ),

        StatisticCard(
          title: "Planned",
          value: planned,
          icon: Icons.schedule,
          color: Colors.orange,
        ),

        StatisticCard(
          title: "Completed",
          value: completed,
          icon: Icons.check_circle,
          color: Colors.teal,
        ),
      ],
    );
  }
}
