// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/home_shell_page.dart';

void main() {
  runApp(const OlahRasaMobileApp());
}

class OlahRasaMobileApp extends StatelessWidget {
  const OlahRasaMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OlahRasa Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomeShellPage(),
    );
  }
}