import 'package:flutter/material.dart';
import '../settings_screen.dart';

class DashboardPetugas extends StatelessWidget {
  const DashboardPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portal Petugas"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard Pelayanan",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Status Posyandu Mawar Desa hari ini",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // KARTU STATISTIK MOCKUP
            Card(
              color: const Color(0xFF2E7D32).withOpacity(0.08),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Color(0xFF2E7D32), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Peserta Terdaftar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "50",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _statAngka("Online", "20", Colors.blue),
                        _statAngka("Offline", "30", Colors.orange),
                        _statAngka("Hadir", "47", Colors.green),
                        _statAngka("Absen", "3", Colors.red),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "MBG Telah Dibagikan : 45 / 50",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              "Kelola Operasional (Locked)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // LIST MENU PETUGAS (TANPA POP-UP NOTIFIKASI)
            _menuPetugas(
              context,
              "Kelola Antrean Masuk",
              Icons.format_list_numbered_rtl_rounded,
              () {},
            ),
            _menuPetugas(
              context,
              "Tambah Antrean Manual",
              Icons.person_add_alt_1_rounded,
              () {},
            ),
            _menuPetugas(
              context,
              "Verifikasi Kehadiran",
              Icons.fact_check_outlined,
              () {},
            ),
            _menuPetugas(
              context,
              "Distribusi MBG",
              Icons.takeout_dining_outlined,
              () {},
            ),
            _menuPetugas(
              context,
              "Laporan Rekapitulasi",
              Icons.insert_chart_outlined,
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _statAngka(String label, String angka, Color warna) {
    return Column(
      children: [
        Text(
          angka,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: warna,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _menuPetugas(
    BuildContext context,
    String judul,
    IconData ikon,
    VoidCallback onClick,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(ikon, color: const Color(0xFF2E7D32)),
        ),
        title: Text(
          judul,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        trailing: const Icon(
          Icons.lock_outline_rounded,
          size: 18,
          color: Colors.grey,
        ),
        onTap: onClick,
      ),
    );
  }
}
