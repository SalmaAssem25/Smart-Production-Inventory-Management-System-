import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/production/create_batch/create_batch_controller.dart';

class CreateBatchScreen extends StatefulWidget {
  const CreateBatchScreen({super.key});

  @override
  State<CreateBatchScreen> createState() => _CreateBatchScreenState();
}

class _CreateBatchScreenState extends State<CreateBatchScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController quantityController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final controller = CreateBatchController();

  String? selectedProduct;
  String? selectedLine;

  DateTime expectedDate = DateTime.now().add(const Duration(days: 2));

  final List<String> products = ["Milk", "Orange Juice", "Yogurt", "Cheese"];

  final List<String> productionLines = ["Line 1", "Line 2", "Line 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Batch")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Batch Information",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                value: selectedProduct,
                decoration: const InputDecoration(
                  labelText: "Product",
                  border: OutlineInputBorder(),
                ),
                items: products
                    .map(
                      (product) => DropdownMenuItem(
                        value: product,
                        child: Text(product),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedProduct = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Please select a product" : null,
              ),

              const SizedBox(height: 18),

              TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Quantity",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter quantity";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 18),

              DropdownButtonFormField<String>(
                value: selectedLine,
                decoration: const InputDecoration(
                  labelText: "Production Line",
                  border: OutlineInputBorder(),
                ),
                items: productionLines
                    .map(
                      (line) =>
                          DropdownMenuItem(value: line, child: Text(line)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLine = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Select production line" : null,
              ),

              const SizedBox(height: 18),

              TextFormField(
                controller: notesController,
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
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    await controller.createBatch(
                      productName: selectedProduct!,
                      quantity: int.parse(quantityController.text),
                      productionLine: selectedLine!,
                      notes: notesController.text,
                    );

                    if (!mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Batch created successfully!"),
                      ),
                    );

                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Create Batch",
                    style: TextStyle(fontSize: 18),
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
