import 'package:cloud_firestore/cloud_firestore.dart';

class ProductionBatchModel {
  final String id;
  final String batchNumber;
  final String productName;
  final int quantity;
  final int producedQuantity;
  final int rejectedQuantity;
  final String productionLine;
  final String status;
  final String supervisorId;
  final String supervisorName;
  final String notes;
  final Timestamp createdAt;
  final Timestamp expectedCompletionDate;

  const ProductionBatchModel({
    required this.id,
    required this.batchNumber,
    required this.productName,
    required this.quantity,
    required this.producedQuantity,
    required this.rejectedQuantity,
    required this.productionLine,
    required this.status,
    required this.supervisorId,
    required this.supervisorName,
    required this.notes,
    required this.createdAt,
    required this.expectedCompletionDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'batchNumber': batchNumber,
      'productName': productName,
      'quantity': quantity,
      'producedQuantity': producedQuantity,
      'rejectedQuantity': rejectedQuantity,
      'productionLine': productionLine,
      'status': status,
      'supervisorId': supervisorId,
      'supervisorName': supervisorName,
      'notes': notes,
      'createdAt': createdAt,
      'expectedCompletionDate': expectedCompletionDate,
    };
  }

  factory ProductionBatchModel.fromMap(String id, Map<String, dynamic> data) {
    return ProductionBatchModel(
      id: id,
      batchNumber: data['batchNumber'] ?? '',
      productName: data['productName'] ?? '',
      quantity: data['quantity'] ?? 0,
      producedQuantity: data['producedQuantity'] ?? 0,
      rejectedQuantity: data['rejectedQuantity'] ?? 0,
      productionLine: data['productionLine'] ?? '',
      status: data['status'] ?? 'Planned',
      supervisorId: data['supervisorId'] ?? '',
      supervisorName: data['supervisorName'] ?? '',
      notes: data['notes'] ?? '',
      createdAt: data['createdAt'] as Timestamp,
      expectedCompletionDate: data['expectedCompletionDate'] as Timestamp,
    );
  }
}
