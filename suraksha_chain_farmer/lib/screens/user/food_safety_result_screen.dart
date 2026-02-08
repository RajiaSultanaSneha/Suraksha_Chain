import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class FoodSafetyResultScreen extends StatefulWidget {
  final String imagePath;

  const FoodSafetyResultScreen({super.key, required this.imagePath});

  @override
  State<FoodSafetyResultScreen> createState() => _FoodSafetyResultScreenState();
}

class _FoodSafetyResultScreenState extends State<FoodSafetyResultScreen> {
  late bool _isSafe;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _analyzeImage();
  }

  void _analyzeImage() async {
    // Simulate processing delay
    await Future.delayed(const Duration(seconds: 2));

    // Randomly decide the outcome
    setState(() {
      _isSafe = Random().nextBool();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Analysis Result'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),
                  const Text('Analyzing sample...'),
                ],
              ),
            )
          : Column(
              children: [
                // Captured Image Section
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.black,
                  child: Image.file(File(widget.imagePath), fit: BoxFit.cover),
                ),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _isSafe
                          ? const Color(0xFFE8F5E9)
                          : const Color(0xFFFFEBEE),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _isSafe
                              ? Icons.check_circle
                              : Icons.warning_amber_rounded,
                          size: 80,
                          color: _isSafe ? Colors.green : Colors.red,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _isSafe ? 'Safe ✅' : 'Formalin Detected ❌',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: _isSafe
                                ? Colors.green[800]
                                : Colors.red[800],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _isSafe
                              ? 'No harmful chemicals detected. Safe for consumption.'
                              : 'Harmful levels of formalin detected! Do not consume.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: _isSafe
                                ? Colors.green[700]
                                : Colors.red[700],
                          ),
                        ),

                        const Spacer(),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _isSafe
                                  ? Colors.green
                                  : Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Scan New Item',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
    );
  }
}
