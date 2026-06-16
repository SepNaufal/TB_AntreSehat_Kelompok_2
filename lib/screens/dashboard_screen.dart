import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
import 'settings_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AntreSehat"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo, Selamat Datang!",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Aplikasi manajemen antrean Posyandu dan Klinik Desa",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            DashboardCard(
              title: "Ambil Antrean",
              icon: Icons.add_to_home_screen_rounded,
              iconColor: Colors.green,
              onTap: () {},   // ✅ kosongkan
            ),
            DashboardCard(
              title: "Riwayat Antrean",
              icon: Icons.history_rounded,
              iconColor: Colors.orange,
              onTap: () {},   // ✅ kosongkan
            ),
            DashboardCard(
              title: "Informasi Layanan",
              icon: Icons.info_outline_rounded,
              iconColor: Colors.blue,
              onTap: () {},   // ✅ kosongkan
            ),
          ],
        ),
      ),
    );
  }
}