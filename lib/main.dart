import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // Fungsi static bantu untuk mengambil instansiasi State dari Screen lain
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Secara default aplikasi dimulai dengan Mode Terang (Light Mode)
  ThemeMode _themeMode = ThemeMode.light;

  // Fungsi pengubah tema yang akan dipanggil dari objek SettingsScreen
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AntreSehat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode, // Menghubungkan variabel internal ke konfigurasi MaterialApp
      home: const LoginScreen(), // Memulai aplikasi pertama kali di Halaman Login
    );
  }
}