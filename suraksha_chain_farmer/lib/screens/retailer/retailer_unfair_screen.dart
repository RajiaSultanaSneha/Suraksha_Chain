import 'package:flutter/material.dart';

class RetailerUnfairScreen extends StatelessWidget {
  final int currentPrice;

  const RetailerUnfairScreen({super.key, required this.currentPrice});

  @override
  Widget build(BuildContext context) {
    // ✅ Demo Pricing Rules
    const double farmerPrice = 40;
    const double distributorPrice = 50;

    // ✅ Fair Range (System Rule)
    const double fairStart = 50;
    const double fairEnd = 70;

    // ✅ Market Average
    const double marketAverage = 60;

    // ✅ Percent Over Fair Limit
    final double overPercent = ((currentPrice - fairEnd) / fairEnd) * 100;

    // ✅ Over Amount
    final double overAmount = currentPrice - marketAverage;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Top Alert Header
            Container(
              width: double.infinity,
              color: const Color(0xFFFFF0F0),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFE53935),
                    size: 28,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Price Alert!',
                    style: TextStyle(
                      color: Color(0xFFE53935),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),

                    // ✅ Title
                    const Text(
                      'Unfair Price Detected',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ✅ Description
                    Text(
                      "Your entered price is above the fair range.\n"
                      "This product may be flagged for consumers.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ✅ Image Card
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.red.withOpacity(0.08),
                        image: const DecorationImage(
                          image: AssetImage("assets/unfair.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ✅ Pricing Comparison Section
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'PRICING COMPARISON',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Your Current Price',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "৳${currentPrice.toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFE53935),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Fair Range',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "৳50 - ৳70",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4CAF50),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // ✅ Range Visualization
                          LayoutBuilder(
                            builder: (context, constraints) {
                              const double minPrice = 40;
                              const double maxPrice = 100;
                              const double range = maxPrice - minPrice;

                              final double width = constraints.maxWidth;

                              final double fairStartPos =
                                  ((fairStart - minPrice) / range) * width;
                              final double fairWidth =
                                  ((fairEnd - fairStart) / range) * width;

                              final double currentPos =
                                  ((currentPrice - minPrice) / range) * width;

                              return SizedBox(
                                height: 40,
                                child: Stack(
                                  children: [
                                    // Track
                                    Center(
                                      child: Container(
                                        height: 8,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Fair Range Bar
                                    Positioned(
                                      left: fairStartPos,
                                      top: 16,
                                      child: Container(
                                        height: 8,
                                        width: fairWidth,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4CAF50),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Current Price Dot
                                    Positioned(
                                      left: currentPos - 6,
                                      top: 14,
                                      child: Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE53935),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 12),

                          // ✅ Labels
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "৳40",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "FAIR PRICE ZONE",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4CAF50),
                                ),
                              ),
                              Text(
                                "৳100",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ✅ Stats Row
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            label: 'MARKET AVERAGE',
                            value: "৳${marketAverage.toStringAsFixed(0)}",
                            valueColor: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildStatCard(
                            label: 'OVER FAIR LIMIT',
                            value: "+৳${overAmount.toStringAsFixed(0)}",
                            valueColor: const Color(0xFFE53935),
                            badge: " +${overPercent.toStringAsFixed(0)}% ",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // ✅ Back Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Go Back & Adjust Price",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Small Stat Card Widget
  Widget _buildStatCard({
    required String label,
    required String value,
    required Color valueColor,
    String? badge,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: valueColor,
                ),
              ),
              if (badge != null) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE53935),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
