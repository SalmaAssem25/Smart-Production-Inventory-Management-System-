import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/models/batch_model.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/create_batch/create_batch_screen.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/dashboard/widgets/dashboard_header.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/dashboard/widgets/production_calendar.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/dashboard/widgets/production_line_chart.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/dashboard/widgets/statistics_grid.dart';
import 'production_dashboard_controller.dart';
import 'widgets/batch_card.dart';

class ProductionDashboardScreen extends StatefulWidget {
  const ProductionDashboardScreen({super.key});

  @override
  State<ProductionDashboardScreen> createState() =>
      _ProductionDashboardScreenState();
}

class _ProductionDashboardScreenState extends State<ProductionDashboardScreen> {
  late final ProductionDashboardController controller;

  @override
  void initState() {
    super.initState();

    controller = ProductionDashboardController();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Production Dashboard")),

      body: StreamBuilder<List<ProductionBatchModel>>(
        stream: controller.allBatches,
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

          final batches = snapshot.data ?? [];
          double line1 = 0;
          double line2 = 0;
          double line3 = 0;

          for (final batch in batches) {
            switch (batch.productionLine) {
              case 'Line 1':
                line1 += batch.quantity;
                break;

              case 'Line 2':
                line2 += batch.quantity;
                break;

              case 'Line 3':
                line3 += batch.quantity;
                break;
            }
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DashboardHeader(supervisorName: "Salma"),

                const SizedBox(height: 25),

                StatisticsGrid(
                  total: controller.getTotal(batches),
                  planned: controller.getPlanned(batches),
                  running: controller.getRunning(batches),
                  completed: controller.getCompleted(batches),
                ),

                const SizedBox(height: 24),

                ProductionLineChart(line1: line1, line2: line2, line3: line3),

                const SizedBox(height: 30),

                const Text(
                  "Production Batches",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                if (batches.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text("No production batches yet."),
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: batches.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: BatchCard(batch: batches[index]),
                      );
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
