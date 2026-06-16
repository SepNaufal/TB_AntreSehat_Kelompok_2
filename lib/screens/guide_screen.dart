import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data list panduan langkah penggunaan aplikasi
    final List<Map<String, String>> steps = [
      {"step": "1", "desc": "Login menggunakan NIK dan nomor HP."},
      {"step": "2", "desc": "Masuk ke dashboard utama aplikasi."},
      {"step": "3", "desc": "Pilih menu layanan antrean yang diinginkan."},
      {"step": "4", "desc": "Ambil nomor urut antrean digital Anda."},
      {"step": "5", "desc": "Tunggu dengan nyaman hingga nomor dipanggil oleh petugas."},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Panduan Penggunaan")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                child: Text(steps[index]["step"]!),
              ),
              title: Text(
                steps[index]["desc"]!,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          );
        },
      ),
    );
  }
}