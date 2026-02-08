import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:suraksha_chain_farmer/screens/user/food_scanner_details_screen.dart';

class FoodQrScannerScreen extends StatelessWidget {
  const FoodQrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan Product QR"), centerTitle: true),
      body: MobileScanner(
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;

          if (barcodes.isNotEmpty) {
            // ✅ Once scanned, go to Product Details screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const FoodScannerDetailsScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}
