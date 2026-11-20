import 'package:flutter/material.dart';

class AppColors {
  static const green = Color(0xFF2E6B5E);
  static const orange = Color(0xFFE0835A);
  static const beige = Color(0xFFF0D9B5);
  static const yellow = Color(0xFFF7E58A);
}

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.green,
    primary: AppColors.green,
    secondary: AppColors.orange,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.green,
    foregroundColor: Colors.white,
  ),
);