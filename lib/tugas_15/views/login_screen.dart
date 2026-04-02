import 'dart:async';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas_15/api/auth_api.dart';
import 'package:belajar_flutter/tugas_15/views/register_screen.dart';

// WAJIB DIBUKA COMMENT-NYA: Biar token bisa disimpen dan halaman bisa pindah
import 'package:belajar_flutter/tugas_15/database/preference.dart';
import 'package:belajar_flutter/tugas_15/views/profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isObscure = true; // Untuk hide/show password

  Future<void> _handleLogin() async {
    // Validasi form kosong
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackbar("Email dan password tidak boleh kosong!", Colors.redAccent);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await AuthApi.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // --- BAGIAN INI GUA AKTIFIN ---
      // Simpan token ke lokal database (SharedPreferences)
      String token = response.data?.token ?? "";
      await PreferenceHandler.storingToken(token);

      _showSnackbar("Login Berhasil!", Colors.green);

      // Navigasi ke Profile Screen dan hapus layar login dari tumpukan (PushReplacement)
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      }
      // -------------------------------
    } catch (e) {
      // Hilangkan tulisan "Exception:" dari error message
      String errorMsg = e.toString().replaceAll("Exception: ", "");
      _showSnackbar(errorMsg, Colors.redAccent);
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector untuk menyembunyikan keyboard saat tap area kosong
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // --- HEADER TEXT ---
                const Text(
                  "Selamat Datang",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E293B), // Biru gelap modern
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Silakan masuk untuk mencatat kehadiran Anda hari ini.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 48),

                // --- FORM EMAIL ---
                _buildLabel("Alamat Email"),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _customInputDecoration(
                    hintText: "nama@email.com",
                    icon: Icons.email_outlined,
                  ),
                ),
                const SizedBox(height: 24),

                // --- FORM PASSWORD ---
                _buildLabel("Kata Sandi"),
                TextField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration:
                      _customInputDecoration(
                        hintText: "Masukkan kata sandi",
                        icon: Icons.lock_outline,
                      ).copyWith(
                        // Tombol mata untuk password
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey.shade500,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                ),
                const SizedBox(height: 12),

                // --- LUPA PASSWORD ---
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Lupa Kata Sandi?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2563EB), // Primary Blue
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // --- TOMBOL LOGIN ---
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      disabledBackgroundColor: const Color(0xFF93C5FD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          )
                        : const Text(
                            "Masuk",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 24),

                // --- LINK REGISTER ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum punya akun? ",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Daftar Sekarang",
                        style: TextStyle(
                          color: Color(0xFF2563EB),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget kecil untuk label text biar rapi
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF334155),
        ),
      ),
    );
  }

  // Desain kustom untuk TextField (modern, clean, ga kaku)
  InputDecoration _customInputDecoration({
    required String hintText,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
      prefixIcon: Icon(icon, color: Colors.grey.shade500, size: 22),
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none, // Hilangkan garis border default
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xFF2563EB),
          width: 1.5,
        ), // Garis biru saat diketik
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
          width: 1,
        ), // Garis tipis saat idle
      ),
    );
  }
}
