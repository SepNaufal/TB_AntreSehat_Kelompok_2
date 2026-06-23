import 'package:flutter/material.dart';
import '../main.dart';
import 'guide_screen.dart';
import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Memeriksa status kecerahan layar untuk menentukan nilai switch tema
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text("Pengaturan")),
      body: ListView(
        children: [
          // Switch Toggle Ganti Tema
          SwitchListTile(
            title: const Text("Ganti Tema (Dark Mode)"),
            secondary: const Icon(Icons.dark_mode_outlined),
            value: isDark,
            onChanged: (bool value) {
              // Mengubah State tema global di main.dart secara langsung
              MyApp.of(context)?.changeTheme(
                value ? ThemeMode.dark : ThemeMode.light,
              );
            },
          ),
          const Divider(),

          // Menu Panduan Penggunaan
          ListTile(
            leading: const Icon(Icons.menu_book_rounded),
            title: const Text("Panduan Penggunaan"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GuideScreen()),
              );
            },
          ),

          // Menu Tentang Aplikasi (Menggunakan Dialog Bawaan Flutter)
          ListTile(
            leading: const Icon(Icons.help_center_rounded),
            title: const Text("Tentang Aplikasi"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "AntreSehat",
                applicationVersion: "1.0.0 (MVP Tahap 1)",
                applicationIcon: const Icon(Icons.local_hospital, color: Colors.green),
                children: [
                  const Text("Aplikasi sistem manajemen antrean yang didesain khusus untuk efisiensi pelayanan Posyandu dan Klinik di Desa."),
                ],
              );
            },
          ),
          const Divider(),

          // Tombol Keluar Akun (Log Out)
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.red),
            title: const Text("Keluar Akun", style: TextStyle(color: Colors.red)),
            onTap: () {
              // Menghapus semua riwayat halaman tumpukan dan kembali ke login
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}