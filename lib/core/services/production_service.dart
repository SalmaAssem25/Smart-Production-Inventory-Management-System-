import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/models/batch_model.dart';

class ProductionService {
  ProductionService._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final CollectionReference<Map<String, dynamic>> _productionCollection =
      _firestore.collection('production');

  /// Create Production Batch
  static Future<void> createBatch(ProductionBatchModel batch) async {
    await _productionCollection.add(batch.toMap());
  }

  /// Get All Production Batches
  static Stream<List<ProductionBatchModel>> getBatches() {
    return _productionCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return ProductionBatchModel.fromMap(doc.id, doc.data());
          }).toList();
        });
  }

  /// Update Batch Status
  static Future<void> updateBatchStatus(String batchId, String status) async {
    await _productionCollection.doc(batchId).update({'status': status});
  }
}
