import 'package:flutter/material.dart';
import 'package:suraksha_chain_farmer/screens/distributor/distributor_update_screen.dart';

class QRDetailsScreen extends StatelessWidget {
  const QRDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Static Demo Product Data
    const String productName = "Tomato";
    const String farmerName = "Abdul Karim";
    const String origin = "Bogura, Bangladesh";
    const String basePrice = "40৳ per kg";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Product QR Verification ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ✅ QR Code Image (Static)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 2),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Scan QR Code",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),

                        // ✅ Put your QR image here
                        Image.asset("assets/tomato.png", height: 160),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ✅ Product Details Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Product Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(thickness: 1),
                        SizedBox(height: 10),

                        Text("📦 Product: Tomato"),
                        SizedBox(height: 6),
                        Text("👨‍🌾 Farmer: Abdul Karim"),
                        SizedBox(height: 6),
                        Text("📍 Origin: Bogura, Bangladesh"),
                        SizedBox(height: 6),
                        Text("💰 Base Price: 40৳ per kg"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ✅ Demo Blockchain Status
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.verified, color: Colors.green),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Blockchain Verification Successful ✅\n"
                            "This record is immutable (Demo Data)",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const DistributorUpdateScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),

          // ✅ Continue Button (Pinned to Bottom)
        ],
      ),
    );
  }
}
