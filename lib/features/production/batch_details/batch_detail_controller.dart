import 'package:flutter/material.dart';
import '../../../core/models/batch_model.dart';
import '../../../core/services/production_service.dart';

class BatchDetailController {
  final ProductionBatchModel batch;

  BatchDetailController(this.batch) {
    producedController.text = batch.producedQuantity.toString();
    rejectedController.text = batch.rejectedQuantity.toString();
    notesController.text = batch.notes;
  }

  final TextEditingController producedController = TextEditingController();
  final TextEditingController rejectedController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  bool get isPlanned => batch.status == "Planned";
  bool get isRunning => batch.status == "Running";
  bool get isCompleted => batch.status == "Completed";

  Future<void> onButtonPressed() async {
    if (isPlanned) {
      await ProductionService.updateBatchStatus(batch.id, "Running");
      return;
    }

    if (isRunning) {
      await ProductionService.completeBatch(
        batchId: batch.id,
        producedQuantity:
            int.tryParse(producedController.text) ?? batch.producedQuantity,
        rejectedQuantity:
            int.tryParse(rejectedController.text) ?? batch.rejectedQuantity,
        notes: notesController.text,
      );
    }
  }

  void dispose() {
    producedController.dispose();
    rejectedController.dispose();
    notesController.dispose();
  }
}
