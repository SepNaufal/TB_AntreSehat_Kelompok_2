import 'package:flutter/material.dart';
import 'peserta/dashboard_peserta.dart';
import 'petugas/dashboard_petugas.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // false = Login Peserta, true = Login Petugas
  bool _isPetugasRole = false;

  // Controller Form Peserta
  final _nikController = TextEditingController();
  final _phoneController = TextEditingController();

  // Controller Form Petugas
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      if (_isPetugasRole) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPetugas()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPeserta()),
        );
      }
    }
  }

  @override
  void dispose() {
    _nikController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                const Icon(
                  Icons.local_hospital_rounded,
                  size: 80,
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
                const Text("Sistem Antrean Posyandu & Klinik Desa"),
                const SizedBox(height: 30),

                // TOGGLE PILIHAN ROLE (PESERTA / PETUGAS)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: !_isPetugasRole
                                ? const Color(0xFF2E7D32)
                                : Colors.transparent,
                            foregroundColor: !_isPetugasRole
                                ? Colors.white
                                : Colors.grey[700],
                            elevation: !_isPetugasRole ? 2 : 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () =>
                              setState(() => _isPetugasRole = false),
                          child: const Text(
                            "Peserta Posyandu",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isPetugasRole
                                ? const Color(0xFF2E7D32)
                                : Colors.transparent,
                            foregroundColor: _isPetugasRole
                                ? Colors.white
                                : Colors.grey[700],
                            elevation: _isPetugasRole ? 2 : 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () =>
                              setState(() => _isPetugasRole = true),
                          child: const Text(
                            "Petugas / Kader",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // ================= FORM PESERTA =================
                if (!_isPetugasRole) ...[
                  TextFormField(
                    controller: _nikController,
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                    decoration: const InputDecoration(
                      labelText: "NIK (16 Digit)",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.badge_outlined),
                      counterText: "",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "NIK wajib diisi";
                      if (value.length != 16) return "NIK harus 16 digit";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Nomor HP",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone_android_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Nomor HP wajib diisi";
                      return null;
                    },
                  ),
                ]
                // ================= FORM PETUGAS =================
                else ...[
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email Petugas",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Email wajib diisi";
                      if (!value.contains('@'))
                        return "Gunakan format email valid";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Password wajib diisi";
                      return null;
                    },
                  ),
                ],

                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _handleLogin,
                    child: Text(
                      _isPetugasRole ? "Masuk Portal Petugas" : "Masuk",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
