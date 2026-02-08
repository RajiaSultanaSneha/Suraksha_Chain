import 'package:flutter/material.dart';
import 'package:suraksha_chain_farmer/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suraksha Chain',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1559D6)),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default font, can be changed
      ),
      home: const SplashScreen(),
    );
  }
}
