import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryGreen = Color(0xFF2E7D32);

  static const _cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryGreen,
      brightness: Brightness.light,
      primary: primaryGreen,
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryGreen,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    cardTheme: const CardThemeData(
      elevation: 2,
      shape: _cardShape,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryGreen,
      brightness: Brightness.dark,
      primary: primaryGreen,
      surface: Color(0xFF1E1E1E),
    ),
    scaffoldBackgroundColor: Color(0xFF121212),
    appBarTheme: AppBarTheme(          // ← hapus const di sini
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    cardTheme: const CardThemeData(
      elevation: 2,
      shape: _cardShape,
    ),
  );
}