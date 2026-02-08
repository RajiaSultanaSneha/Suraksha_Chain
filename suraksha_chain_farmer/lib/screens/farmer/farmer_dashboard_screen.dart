import 'package:flutter/material.dart';
import 'add_product_screen.dart';

class FarmerDashboardScreen extends StatelessWidget {
  const FarmerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Light grey background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=11',
                    ), // Mock User Image
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DASHBOARD',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const Text(
                        'Abdul Karim',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.notifications_none_rounded),
                      color: Colors.grey[800],
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Main Action Card (Add New Product)
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddProductScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1559D6), // Primary Blue
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1559D6).withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Add New Product',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'List your harvest for sale',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Secondary Actions Row
              Row(
                children: [
                  Expanded(
                    child: _buildActionCard(
                      icon: Icons.payments_outlined,
                      iconColor: const Color(0xFF1559D6),
                      iconBg: const Color(0xFFE8F0FE),
                      title: 'Set Base Price',
                      subtitle: 'Manage rates',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildActionCard(
                      icon: Icons.qr_code_2_rounded,
                      iconColor: const Color(0xFF7B61FF),
                      iconBg: const Color(0xFFF2EFFF), // Light purple
                      title: 'Generate QR',
                      subtitle: 'Track & Trace',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Listings Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Active Listings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View History',
                      style: TextStyle(
                        color: Color(0xFF1559D6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Listing Items
              _buildListingItem(
                imageIcon: Icons.grass, // Fallback for wheat
                imageColor: Colors.amber,
                title: 'Premium Wheat',
                stock: '450 kg',
                price: '৳2,450/qt',
                status: 'LIVE',
                statusColor: const Color(0xFFE6F7ED), // Light green
                statusTextColor: const Color(0xFF00C853),
                imageUrl:
                    'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?auto=format&fit=crop&q=80&w=200',
              ),
              _buildListingItem(
                imageIcon: Icons.eco, // Fallback for tomato
                imageColor: Colors.red,
                title: 'Hybrid Tomato',
                stock: '120 kg',
                price: '৳1,800/qt',
                status: 'LIVE',
                statusColor: const Color(0xFFE6F7ED),
                statusTextColor: const Color(0xFF00C853),
                imageUrl:
                    'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&q=80&w=200',
              ),
              _buildListingItem(
                imageIcon: Icons.circle, // Fallback for potato
                imageColor: Colors.brown,
                title: 'Organic Potatoes',
                stock: '800 kg',
                price: '৳1,200/qt',
                status: 'PENDING',
                statusColor: const Color(0xFFFFF8E1), // Light yellow
                statusTextColor: const Color(0xFFFFB300),
                // No image url for potato to simulate the icon style in design or just fallback
                isIconMode: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildListingItem({
    required IconData imageIcon,
    required Color imageColor,
    required String title,
    required String stock,
    required String price,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    String? imageUrl,
    bool isIconMode = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image/Icon
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: isIconMode ? const Color(0xFFF5F5F5) : Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              image: (imageUrl != null && !isIconMode)
                  ? DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: (isIconMode || imageUrl == null)
                ? Icon(
                    isIconMode
                        ? Icons.circle
                        : imageIcon, // Use specific material icons if available or generic
                    color: isIconMode ? Colors.brown : imageColor,
                    size: 32,
                  ) // Fallback icon
                : null,
          ),
          const SizedBox(width: 16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Stock: $stock',
                  style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1559D6),
                  ),
                ),
              ],
            ),
          ),
          // Actions
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.qr_code_2, size: 20, color: Colors.grey[700]),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusTextColor,
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
