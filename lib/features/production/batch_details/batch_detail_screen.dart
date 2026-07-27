import 'package:flutter/material.dart';
import '../../../core/models/batch_model.dart';
import '../../../core/services/production_service.dart';

class BatchDetailsScreen extends StatelessWidget {
  final ProductionBatchModel batch;

  const BatchDetailsScreen({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Batch Details")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              batch.batchNumber,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            detailTile("Product", batch.productName),
            detailTile("Quantity", "${batch.quantity}"),
            detailTile("Produced", "${batch.producedQuantity}"),
            detailTile("Rejected", "${batch.rejectedQuantity}"),
            detailTile("Production Line", batch.productionLine),
            detailTile("Supervisor", batch.supervisorName),
            detailTile("Status", batch.status),
            detailTile(
              "Expected Completion",
              batch.expectedCompletionDate.toDate().toString().split(" ").first,
            ),

            detailTile("Notes", batch.notes),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: batch.status == "Completed"
                    ? null
                    : () async {
                        if (batch.status == "Planned") {
                          await ProductionService.updateBatchStatus(
                            batch.id,
                            "Running",
                          );
                        } else if (batch.status == "Running") {
                          await ProductionService.updateBatchStatus(
                            batch.id,
                            "Completed",
                          );
                        }

                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                child: Text(
                  batch.status == "Planned"
                      ? "Start Production"
                      : batch.status == "Running"
                      ? "Complete Batch"
                      : "Completed",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
