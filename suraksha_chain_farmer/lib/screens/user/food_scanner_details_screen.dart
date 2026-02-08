import 'dart:math';
import 'package:flutter/material.dart';

class FoodScannerDetailsScreen extends StatefulWidget {
  const FoodScannerDetailsScreen({super.key});

  @override
  State<FoodScannerDetailsScreen> createState() =>
      _FoodScannerDetailsScreenState();
}

class _FoodScannerDetailsScreenState extends State<FoodScannerDetailsScreen> {
  late double retailerPrice;
  late bool isFair;

  @override
  void initState() {
    super.initState();

    // ✅ Random Fair or Unfair Price
    bool randomResult = Random().nextBool();

    if (randomResult) {
      retailerPrice = 65; // ✅ Fair Price
      isFair = true;
    } else {
      retailerPrice = 85; // ❌ Unfair Price
      isFair = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Static Demo Data
    const String productName = "Tomato";
    const String farmerName = "Abdul Karim";
    const String origin = "Bogura, Bangladesh";

    // ✅ Price History
    const double farmerPrice = 40;
    const double distributorPrice = 50;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Product Verification',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Image
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[50],
              child: Image.asset("assets/tomato.png", fit: BoxFit.contain),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Header
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  Text(
                    "Farmer: $farmerName",
                    style: TextStyle(color: Colors.grey[600]),
                  ),

                  Text(
                    "Origin: $origin",
                    style: TextStyle(color: Colors.grey[600]),
                  ),

                  const SizedBox(height: 20),

                  // ✅ Blockchain Verified Badge
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.verified, color: Colors.green.shade600),
                        const SizedBox(width: 10),
                        const Text(
                          "Blockchain Verified Record ✅",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ✅ Price History
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Price History",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),

                        _priceRow("Farmer Price", farmerPrice, Colors.green),
                        _priceRow(
                          "Distributor Price",
                          distributorPrice,
                          Colors.blue,
                        ),
                        _priceRow(
                          "Retailer Price",
                          retailerPrice,
                          isFair ? Colors.green : Colors.red,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ✅ Fair or Unfair Status
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: isFair ? Colors.green.shade50 : Colors.red.shade50,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isFair
                              ? Icons.check_circle
                              : Icons.warning_amber_rounded,
                          color: isFair ? Colors.green : Colors.red,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            isFair
                                ? "✅ Fair Price Detected\nConsumer can safely buy this product."
                                : "❌ Unfair Price Detected!\nConsumer will receive an alert.",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ✅ Refresh Button for Demo
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     minimumSize: const Size(double.infinity, 50),
                  //     backgroundColor: Colors.black,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       bool randomResult = Random().nextBool();
                  //       if (randomResult) {
                  //         retailerPrice = 65;
                  //         isFair = true;
                  //       } else {
                  //         retailerPrice = 85;
                  //         isFair = false;
                  //       }
                  //     });
                  //   },
                  //   child: const Text(
                  //     "Scan Another Product (Random Demo)",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String label, double price, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[700])),
          Text(
            "৳${price.toStringAsFixed(0)}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
