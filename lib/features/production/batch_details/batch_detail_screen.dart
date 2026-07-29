import 'package:flutter/material.dart';
import '../../../core/models/batch_model.dart';
import 'batch_detail_controller.dart';

class BatchDetailsScreen extends StatefulWidget {
  final ProductionBatchModel batch;

  const BatchDetailsScreen({super.key, required this.batch});

  @override
  State<BatchDetailsScreen> createState() => _BatchDetailsScreenState();
}

class _BatchDetailsScreenState extends State<BatchDetailsScreen> {
  late BatchDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = BatchDetailController(widget.batch);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Batch Details")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.batch.batchNumber,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              detailTile("Product", widget.batch.productName),
              detailTile("Quantity", widget.batch.quantity.toString()),

              const SizedBox(height: 15),

              TextField(
                controller: controller.producedController,
                enabled: controller.isRunning,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Produced Quantity",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 18),

              TextField(
                controller: controller.rejectedController,
                enabled: controller.isRunning,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Rejected Quantity",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 18),

              detailTile("Production Line", widget.batch.productionLine),

              detailTile("Supervisor", widget.batch.supervisorName),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Text(
                    "Status:",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),

                  const SizedBox(width: 12),

                  Chip(
                    label: Text(widget.batch.status),
                    backgroundColor: widget.batch.status == "Completed"
                        ? Colors.green.shade100
                        : widget.batch.status == "Running"
                        ? Colors.orange.shade100
                        : Colors.blue.shade100,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              detailTile(
                "Expected Completion",
                widget.batch.expectedCompletionDate
                    .toDate()
                    .toString()
                    .split(" ")
                    .first,
              ),

              const SizedBox(height: 15),

              TextField(
                controller: controller.notesController,
                enabled: controller.isRunning,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: "Notes",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isCompleted
                        ? Colors.grey
                        : const Color(0xFF0D47A1),
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: controller.isCompleted
                      ? null
                      : () async {
                          await controller.onButtonPressed();

                          if (mounted) {
                            Navigator.pop(context);
                          }
                        },
                  child: Text(
                    controller.isPlanned
                        ? "Start Production"
                        : controller.isRunning
                        ? "Complete Batch"
                        : "Completed",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
