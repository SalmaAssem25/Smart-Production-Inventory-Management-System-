import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/dashboard/widgets/section_title.dart';

import '../../app/colors.dart';
import 'widgets/summary_card.dart';
import 'widgets/production_card.dart';
import 'widgets/alert_card.dart';
import 'widgets/activity_tile.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("JSPIMS Dashboard"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Good Morning 👋",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              "Factory Manager",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            const SectionTitle(title: "Production Status"),

            const SizedBox(height: 15),

            const Row(
              children: [
                Expanded(
                  child: ProductionCard(
                    title: "Running",
                    value: "12",
                    color: Colors.green,
                    icon: Icons.play_circle,
                  ),
                ),

                SizedBox(width: 15),

                Expanded(
                  child: ProductionCard(
                    title: "Stopped",
                    value: "1",
                    color: Colors.red,
                    icon: Icons.stop_circle,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            const Row(
              children: [
                Expanded(
                  child: SummaryCard(
                    title: "Orders",
                    value: "142",
                    icon: Icons.shopping_cart,
                  ),
                ),

                SizedBox(width: 15),

                Expanded(
                  child: SummaryCard(
                    title: "Produced",
                    value: "18,430",
                    icon: Icons.factory,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const SectionTitle(title: "Inventory Alerts"),

            const SizedBox(height: 15),

            const AlertCard(title: "Milk Packaging Roll Low"),

            const AlertCard(title: "Sugar Stock Below Minimum"),

            const SizedBox(height: 25),

            const SectionTitle(title: "Recent Activities"),

            const SizedBox(height: 15),

            const ActivityTile(title: "Batch #2431 Completed"),

            const ActivityTile(title: "Inventory Updated"),

            const ActivityTile(title: "Production Line 3 Started"),
          ],
        ),
      ),
    );
  }
}
