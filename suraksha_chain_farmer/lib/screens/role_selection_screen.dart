import 'package:flutter/material.dart';
import 'package:suraksha_chain_farmer/screens/login_screen.dart'; // Kept if needed, but navigation changed
import 'package:suraksha_chain_farmer/screens/farmer/farmer_dashboard_screen.dart';
import 'package:suraksha_chain_farmer/screens/user/user_dashboard_screen.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String _selectedRole = 'Farmer'; // Default selection

  final List<Map<String, dynamic>> _roles = [
    {
      'id': 'Farmer',
      'title': 'Farmer',
      'subtitle': 'Producer: Manage crops and sales',
      'icon': Icons.local_florist, // Plant icon
    },
    {
      'id': 'Distributor',
      'title': 'Distributor',
      'subtitle': 'Logistics: Handle transport and supply',
      'icon': Icons.local_shipping, // Truck icon
    },
    {
      'id': 'Retailer',
      'title': 'Retailer',
      'subtitle': 'Sales: Connect products with consumers',
      'icon': Icons.store, // Store icon
    },
    {
      'id': 'Consumer',
      'title': 'Consumer',
      'subtitle': 'Buyer: Purchase products',
      'icon': Icons.shopping_cart, // Store icon
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1559D6), // Approximate blue color
      body: Stack(
        children: [
          // Background Tractor Icon (Watermark)
          Positioned(
            top: 40,
            right: -20,
            child: Icon(
              Icons.agriculture,
              size: 200,
              color: Colors.white.withOpacity(0.1),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.pop(context); // If there's a previous screen
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Join the Chain',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Select your role in the ecosystem to continue',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),

              // White Content Area
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //const SizedBox(height: 10),
                        // Role Cards
                        ..._roles.map((role) => _buildRoleCard(role)),

                        const SizedBox(height: 10),

                        // Info Box
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F7FA),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.info,
                                color: Color(0xFF1559D6),
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Your role determines the features and dashboards available. You can change this later in settings.',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Continue Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_selectedRole == "Consumer") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UserDashboardScreen(),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LoginScreen(userType: _selectedRole),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                0xFF2F70F8,
                              ), // Lighter blue for button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Continue',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoleCard(Map<String, dynamic> role) {
    final bool isSelected = _selectedRole == role['id'];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role['id'];
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF1559D6)
                : Colors.grey.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon Container
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE), // Light blue bg for icon
                shape: BoxShape.circle,
              ),
              child: Icon(
                role['icon'],
                color: const Color(0xFF1559D6),
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    role['subtitle'],
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            // Checkmark
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color(0xFF1559D6),
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
