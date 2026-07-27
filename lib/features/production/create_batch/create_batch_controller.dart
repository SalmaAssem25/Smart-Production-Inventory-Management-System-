import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/models/batch_model.dart';
import '../../../core/services/production_service.dart';

class CreateBatchController {
  Future<void> createBatch({
    required String productName,
    required int quantity,
    required String productionLine,
    required String notes,
  }) async {
    final batch = ProductionBatchModel(
      id: '',
      batchNumber: "PB-${DateTime.now().millisecondsSinceEpoch}",
      productName: productName,
      quantity: quantity,
      producedQuantity: 0,
      rejectedQuantity: 0,
      productionLine: productionLine,
      status: "Planned",
      supervisorId: "temp-supervisor-id",
      supervisorName: "Ahmed",
      notes: notes,
      createdAt: Timestamp.now(),
      expectedCompletionDate: Timestamp.fromDate(
        DateTime.now().add(const Duration(days: 2)),
      ),
    );

    await ProductionService.createBatch(batch);
  }
}
