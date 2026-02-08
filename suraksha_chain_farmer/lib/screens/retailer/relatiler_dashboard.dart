import 'package:flutter/material.dart';
import 'package:suraksha_chain_farmer/screens/retailer/relatiler_qr_scanner_screen.dart';

class RetailerDashboard extends StatelessWidget {
  const RetailerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FC), // Light greyish blue background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildHeroSection(context),
              const SizedBox(height: 28),
              _buildInventoryHeader(),
              const SizedBox(height: 16),
              _buildInventoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE0B2),
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
              ), // Placeholder profile/store icon
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'GOOD MORNING',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Agrimart Store',
              style: TextStyle(
                color: Color(0xFF1A1A1A),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            color: Colors.black87,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                child: Image.asset(
                  'assets/retailer_saner.png', // Hand holding phone/QR context
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Positioned(
              //   bottom: 16,
              //   left: 16,
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 12,
              //       vertical: 6,
              //     ),
              //     decoration: BoxDecoration(
              //       color: const Color(0xFF2962FF),
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: const Text(
              //       'RETAILER TOOL',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 10,
              //         fontWeight: FontWeight.bold,
              //         letterSpacing: 0.8,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Scan QR to Set Price',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Instant pricing updates for your inventory using the camera.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RelatilerQrScannerScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.qr_code_scanner_rounded,
                      size: 22,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Scan Product QR',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2962FF),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'My Inventory',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF2962FF),
            padding: EdgeInsets.zero,
            minimumSize: const Size(50, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'View All',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildInventoryList() {
    final List<Map<String, dynamic>> products = [
      {
        'image':
            'https://plus.unsplash.com/premium_photo-1661962692059-55d5a4319814?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80',
        'name': 'High-yield Urea...',
        'quantity': '120 units',
        'price': '\৳45.00',
        'updated': 'Updated 2h ago',
        'status': 'IN STOCK',
        'statusColor': Colors.green,
      },
      {
        'image':
            'https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80',
        'name': 'Organic Pesticid...',
        'quantity': '45 units',
        'price': '\৳22.50',
        'updated': 'Updated yesterday',
        'status': 'LOW STOCK',
        'statusColor': Colors.orange,
      },
    ];

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildInventoryItem(
          image: product['image'],
          name: product['name'],
          quantity: product['quantity'],
          price: product['price'],
          updated: product['updated'],
          status: product['status'],
          statusColor: product['statusColor'],
        );
      },
    );
  }

  Widget _buildInventoryItem({
    required String image,
    required String name,
    required String quantity,
    required String price,
    required String updated,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[100],
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.layers_outlined,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      quantity,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              //  const SizedBox(height: 6),
              // Text(
              //   updated,
              //   style: TextStyle(
              //     fontSize: 11,
              //     color: Colors.grey[400],
              //     fontStyle: FontStyle.italic,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
