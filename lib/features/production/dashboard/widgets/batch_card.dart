import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/models/batch_model.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/batch_details/batch_detail_screen.dart';

class BatchCard extends StatelessWidget {
  final ProductionBatchModel batch;

  const BatchCard({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BatchDetailsScreen(batch: batch)),
        );
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                batch.productName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text("Quantity: ${batch.quantity}"),
              Text("Production Line: ${batch.productionLine}"),
              Text("Supervisor: ${batch.supervisorName}"),
              Text("Status: ${batch.status}"),
              Text(
                "Expected Completion: ${batch.expectedCompletionDate.toDate().toString().split(' ')[0]}",
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "View Details →",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
