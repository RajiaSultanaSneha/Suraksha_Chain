import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suraksha_chain_farmer/screens/distributor/distributor_dashboard_screen.dart';
import 'package:suraksha_chain_farmer/screens/farmer/farmer_dashboard_screen.dart';
import 'package:suraksha_chain_farmer/screens/retailer/relatiler_dashboard.dart';
import 'package:suraksha_chain_farmer/screens/user/user_dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  final String userType;
  const LoginScreen({super.key, required this.userType});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String? _phoneError;
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1559D6), // Matching blue background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              children: [
                // Icon Box
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons
                        .login_rounded, // or exit_to_app styled to look like entrance
                    color: Color(0xFF1559D6),
                    size: 32,
                  ),
                ),
                const SizedBox(height: 24),
                // Title Text
                const Text(
                  'Login with your\nPhone Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 30),
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
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Input Label
                    const Text(
                      'Enter Mobile Number',
                      style: TextStyle(
                        color: Color(0xFF1559D6),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Phone TextField
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty && value.length < 11) {
                            _phoneError = 'Number must be 11 digits';
                          } else {
                            _phoneError = null;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        errorText: _phoneError,
                        hintText: '017XXXXXXXX',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ), // Rounded pill shape
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xFF1559D6),
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Send Code Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: _isLoading
                            ? null
                            : () async {
                                // Handle send code
                                setState(() {
                                  _isLoading = true;
                                });

                                await Future.delayed(
                                  const Duration(seconds: 2),
                                );

                                if (!mounted) return;

                                setState(() {
                                  _isLoading = false;
                                });

                                if (_phoneController.text.isNotEmpty &&
                                    _phoneController.text.length == 11) {
                                  if (widget.userType.toLowerCase() ==
                                      'farmer') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const FarmerDashboardScreen(),
                                      ),
                                    );
                                  } else if (widget.userType.toLowerCase() ==
                                      'distributor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DistributorDashboardScreen(),
                                      ),
                                    );
                                  } else if (widget.userType.toLowerCase() ==
                                      'retailer') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RetailerDashboard(),
                                      ),
                                    );
                                  } else if (_phoneController.text.startsWith(
                                    '016',
                                  )) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const UserDashboardScreen(),
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Invalid Phone Number'),
                                    ),
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blue[500], // Grey as shown in image
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              )
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Help Section
                    Center(
                      child: Column(
                        children: [
                          // Question Mark Icon
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.withOpacity(0.2),
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.help_outline,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Help Question
                          const Text(
                            'How to Login?',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Help Description
                          Text(
                            'A 4-digit code will be sent to the number. Enter the code to login easily.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
