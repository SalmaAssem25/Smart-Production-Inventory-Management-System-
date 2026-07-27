import 'package:juhayna_smart_production_and_inventory_management_system/core/models/batch_model.dart';
import '../../../core/services/production_service.dart';

class ProductionDashboardController {
  Stream<List<ProductionBatchModel>> get batches =>
      ProductionService.getBatches();

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
