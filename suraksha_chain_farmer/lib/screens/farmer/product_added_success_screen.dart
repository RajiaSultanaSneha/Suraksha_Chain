import 'package:flutter/material.dart';

class ProductAddedSuccessScreen extends StatelessWidget {
  final bool? isDistributor;
  const ProductAddedSuccessScreen({super.key, this.isDistributor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // Success Icon
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9), // Light Green
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Color(0xFF00C853), // Success Green
                  size: 60,
                ),
              ),

              // const SizedBox(height: 24),
              Text(
                isDistributor == true ? 'Shipment Updated!' : 'Product Listed!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                isDistributor == true
                    ? 'Your shipment has been successfully updated.'
                    : 'Your harvest has been successfully added to the marketplace.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 40),

              // QR Code Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    const Text(
                      'TRACKING QR CODE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Color(0xFF1559D6),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage('assets/qrcode.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Scan to view product journey',
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Back to Dashboard Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Pop until we are back at the dashboard (assuming dashboard is the root of this stack)
                    // Or specific navigation if needed.
                    // Using pushAndRemoveUntil to effectively reset to dashboard would be safer
                    // if the stack is deep, but usually 2 pops work (AddProduct -> Success).
                    // Let's use pop twice for now or pushReplacement.
                    Navigator.of(context).pop(); // Pop Success Screen
                    Navigator.of(context).pop(); // Pop Add Product Screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1559D6),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Back to Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
