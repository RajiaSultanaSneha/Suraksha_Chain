import 'package:flutter/material.dart';
import 'package:suraksha_chain_farmer/screens/distributor/qr_scanner_screen.dart';

class DistributorDashboardScreen extends StatelessWidget {
  const DistributorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light grey background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const QRScannerScreen()),
                  );
                },
                child: _buildScanCard(),
              ),
              const SizedBox(height: 28),
              _buildSectionTitle('Quick Management'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildQuickActionCard(
                      icon: Icons.local_shipping_outlined,
                      label: 'Update Transport\nCost',
                      subLabel: 'Adjust logistics fees',
                      iconBgColor: const Color(0xFFE3F2FD), // Light Blue
                      iconColor: const Color(0xFF1565C0), // Dark Blue
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildQuickActionCard(
                      icon: Icons.local_offer_outlined,
                      label: 'Set Next\nPrice',
                      subLabel: 'Manage retail pricing',
                      iconBgColor: const Color(0xFFE8F5E9), // Light Green
                      iconColor: const Color(0xFF2E7D32), // Dark Green
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle('Active Shipments'),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF2563EB),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _buildShipmentCard(
                title: 'Organic Nitrogen Mix',
                location: 'Central Warehouse, IL',
                status: 'IN TRANSIT',
                progress: 0.75,
                eta: 'Tomorrow, 10:00 AM',
                batchId: 'BATCH-4402',
                statusColor: Colors.grey,
                progressColor: const Color(0xFF2563EB),
                imageColor: const Color(0xFF388E3C), // Greenish for organic
              ),
              const SizedBox(height: 16),
              _buildShipmentCard(
                title: 'CropProtect V2 (Liquid)',
                location: 'Sorting Center, IA',
                status: 'PROCESSING',
                progress: 0.30,
                eta: 'Oct 28, 2023',
                batchId: 'BATCH-8911',
                statusColor: Colors.grey,
                progressColor: const Color(0xFF2563EB),
                imageColor: const Color(0xFF8D6E63), // Brownish
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 26,
          backgroundColor: Color(0xFFE0E0E0),
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/150?img=11',
          ), // Mock User Image
          // Using a child Icon as fallback if image isn't found
          child: Icon(Icons.person, color: Colors.grey),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome back,',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'AgriLogix Dist.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1C1E),
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xFF424242),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScanCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF2563EB), // Primary Blue
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2563EB).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.qr_code_scanner_rounded,
              color: Colors.white,
              size: 48,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Scan Product QR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Initiate shipment or check authenticity',
            style: TextStyle(color: Colors.white70, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A1C1E),
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String label,
    required String subLabel,
    required Color iconBgColor,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: iconColor, size: 26),
          ),
          const SizedBox(height: 20),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 1.2,
              color: Color(0xFF1A1C1E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subLabel,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShipmentCard({
    required String title,
    required String location,
    required String status,
    required double progress,
    required String eta,
    required String batchId,
    required Color statusColor,
    required Color progressColor,
    required Color imageColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: imageColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.inventory_2_outlined,
                  color: imageColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF1A1C1E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            location,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.edit_outlined,
                      size: 14,
                      color: Color(0xFF424242),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF424242),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFF0F0F0),
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ETA: $eta',
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  batchId,
                  style: const TextStyle(
                    color: Color(0xFF1565C0),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
