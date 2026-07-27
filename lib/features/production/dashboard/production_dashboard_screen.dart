import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/models/batch_model.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/create_batch/create_batch_screen.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/dashboard/widgets/dashboard_header.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/dashboard/widgets/statistics_grid.dart';

import 'production_dashboard_controller.dart';
import 'widgets/batch_card.dart';

class ProductionDashboardScreen extends StatelessWidget {
  const ProductionDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductionDashboardController();

    return Scaffold(
      appBar: AppBar(title: const Text("Production Dashboard")),

      body: StreamBuilder<List<ProductionBatchModel>>(
        stream: controller.batches,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text("Loading production dashboard..."),
                ],
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Something went wrong:\n${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No production batches found."));
          }

          final batches = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DashboardHeader(supervisorName: "Ahmed"),

                const SizedBox(height: 25),

                StatisticsGrid(
                  total: controller.getTotal(batches),
                  planned: controller.getPlanned(batches),
                  running: controller.getRunning(batches),
                  completed: controller.getCompleted(batches),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Recent Production Batches",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: batches.length,
                  itemBuilder: (context, index) {
                    return BatchCard(batch: batches[index]);
                  },
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateBatchScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
