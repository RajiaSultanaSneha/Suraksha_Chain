import 'package:flutter/material.dart';

import '../farmer/product_added_success_screen.dart';

class DistributorUpdateScreen extends StatefulWidget {
  const DistributorUpdateScreen({super.key});

  @override
  State<DistributorUpdateScreen> createState() =>
      _DistributorUpdateScreenState();
}

class _DistributorUpdateScreenState extends State<DistributorUpdateScreen> {
  // ✅ Division List (7 divisions)
  final List<String> divisions = [
    "Dhaka",
    "Chattogram",
    "Rajshahi",
    "Khulna",
    "Barishal",
    "Sylhet",
    "Rangpur",
  ];

  String? fromDivision;
  String? toDivision;

  final TextEditingController costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Distributor Transport Update",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transport Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // ✅ FROM Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "From Division",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              value: fromDivision,
              items: divisions
                  .map((div) => DropdownMenuItem(value: div, child: Text(div)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  fromDivision = value;
                });
              },
            ),

            const SizedBox(height: 15),

            // ✅ TO Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "To Division",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              value: toDivision,
              items: divisions
                  .map((div) => DropdownMenuItem(value: div, child: Text(div)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  toDivision = value;
                });
              },
            ),

            const SizedBox(height: 15),

            // ✅ Added Cost Input
            TextField(
              controller: costController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Added Transport Cost (৳)",
                hintText: "e.g. 10",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ✅ Submit Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                // ✅ Validation
                if (fromDivision == null ||
                    toDivision == null ||
                    costController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all fields")),
                  );
                  return;
                }

                // ✅ Demo Success
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Distributor Update Saved ✅\n"
                      "$fromDivision → $toDivision | Cost: ৳${costController.text}",
                    ),
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProductAddedSuccessScreen(isDistributor: true),
                  ),
                );
              },
              child: const Text(
                "Submit Distributor Update",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
