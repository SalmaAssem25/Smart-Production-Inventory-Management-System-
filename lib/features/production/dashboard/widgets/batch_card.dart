import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/models/batch_model.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/batch_details/batch_detail_screen.dart';

class BatchCard extends StatelessWidget {
  final ProductionBatchModel batch;

  const BatchCard({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    IconData statusIcon;
    Color statusColor;

    switch (batch.status) {
      case "Completed":
        statusIcon = Icons.check_circle;
        statusColor = Colors.green;
        break;

      case "Running":
        statusIcon = Icons.play_circle_fill;
        statusColor = Colors.orange;
        break;

      default:
        statusIcon = Icons.schedule;
        statusColor = Colors.blue;
    }
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BatchDetailsScreen(batch: batch)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: statusColor.withOpacity(.15),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: statusColor, width: 4)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          batch.productName,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: statusColor,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(statusIcon, color: statusColor, size: 22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  infoRow("Quantity", "${batch.quantity}"),

                  infoRow("Production Line", batch.productionLine),

                  infoRow(
                    "Expected Completion",
                    batch.expectedCompletionDate.toDate().toString().split(
                      ' ',
                    )[0],
                  ),

                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "View Details",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black87),
          children: [
            TextSpan(
              text: "$title: ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D47A1),
              ),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
