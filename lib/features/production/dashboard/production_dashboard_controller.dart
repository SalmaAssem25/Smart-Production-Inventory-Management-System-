import 'package:juhayna_smart_production_and_inventory_management_system/core/models/batch_model.dart';
import '../../../core/services/production_service.dart';
import 'package:flutter/material.dart';

class ProductionDashboardController extends ChangeNotifier {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  void changeSelectedDay(DateTime selected, DateTime focused) {
    selectedDay = selected;
    focusedDay = focused;
    notifyListeners();
  }

  Stream<List<ProductionBatchModel>> get allBatches =>
      ProductionService.getBatches();

  Stream<List<ProductionBatchModel>> get batchesForSelectedDay =>
      ProductionService.getBatchesForDate(selectedDay);

  int getTotal(List<ProductionBatchModel> batches) {
    return batches.length;
  }

  int getPlanned(List<ProductionBatchModel> batches) {
    return batches.where((batch) => batch.status == "Planned").length;
  }

  int getRunning(List<ProductionBatchModel> batches) {
    return batches.where((batch) => batch.status == "Running").length;
  }

  int getCompleted(List<ProductionBatchModel> batches) {
    return batches.where((batch) => batch.status == "Completed").length;
  }
}
