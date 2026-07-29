import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/models/batch_model.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/utils/extensions.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/create_batch/create_batch_screen.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/dashboard/widgets/batch_card.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/dashboard/widgets/production_calendar.dart';

import 'production_controller.dart';

class ProductionScreen extends StatefulWidget {
  const ProductionScreen({super.key});

  @override
  State<ProductionScreen> createState() => _ProductionScreenState();
}

class _ProductionScreenState extends State<ProductionScreen> {
  late final ProductionController controller;

  @override
  void initState() {
    super.initState();

    controller = ProductionController();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(const CreateBatchScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProductionCalendar(
              focusedDay: controller.focusedDay,
              selectedDay: controller.selectedDay,
              onDaySelected: controller.changeSelectedDay,
            ),

            const SizedBox(height: 20),

            Expanded(
              child: StreamBuilder<List<ProductionBatchModel>>(
                stream: controller.batchesForSelectedDay,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  final batches = snapshot.data ?? [];

                  if (batches.isEmpty) {
                    return const Center(
                      child: Text("No production batches for this day."),
                    );
                  }

                  return ListView.builder(
                    itemCount: batches.length,
                    itemBuilder: (context, index) {
                      return BatchCard(batch: batches[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
