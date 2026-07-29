import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/models/batch_model.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/services/production_service.dart';

class ProductionController extends ChangeNotifier {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  Stream<List<ProductionBatchModel>> get batchesForSelectedDay =>
      ProductionService.getBatchesForDate(selectedDay);

  void changeSelectedDay(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay = selectedDay;
    this.focusedDay = focusedDay;
    notifyListeners();
  }
}
