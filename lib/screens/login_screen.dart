import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nikController = TextEditingController();
  final _phoneController = TextEditingController();

  void _handleLogin() {
    // Memeriksa validasi form sebelum berpindah halaman
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    }
  }

  @override
  void dispose() {
    _nikController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Sementara Aplikasi Kesehatan
                const Icon(
                  Icons.local_hospital_rounded,
                  size: 90,
                  color: Color(0xFF2E7D32),
                ),
                const SizedBox(height: 12),
                Text(
                  "AntreSehat",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2E7D32),
                      ),
                ),
                const SizedBox(height: 8),
                const Text("Sistem Antrean Posyandu & Klinik Desa"),
                const SizedBox(height: 40),

                // Form Input NIK
                TextFormField(
                  controller: _nikController,
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  decoration: const InputDecoration(
                    labelText: "NIK (16 Digit)",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.badge_outlined),
                    counterText: "", // Menyembunyikan teks hitungan angka bawaan
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "NIK wajib diisi";
                    if (value.length != 16) return "NIK harus berisi 16 digit";
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) return "NIK harus berupa angka";
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Form Input Nomor HP
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Nomor HP",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone_android_rounded),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Nomor HP wajib diisi";
                    if (value.length < 10) return "Nomor HP minimal 10 digit";
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) return "Nomor HP harus berupa angka";
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Tombol Submit Masuk
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _handleLogin,
                    child: const Text("Masuk", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}