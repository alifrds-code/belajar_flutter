import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas_15/api/profile_api.dart';
import 'package:belajar_flutter/tugas_15/models/profile_model.dart';
import 'package:belajar_flutter/tugas_15/database/preference.dart';
import 'package:belajar_flutter/tugas_15/views/login_screen.dart';
import 'package:belajar_flutter/tugas_15/views/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileModel? _profileData;
  bool _isLoading = true;
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    _fetchProfileData(); // Panggil fungsi tarik data pas halaman dibuka
  }

  Future<void> _fetchProfileData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });

    try {
      // 1. Ambil token dari lokal database
      String? token = await PreferenceHandler.getToken();

      // Kalau token gak ada, lempar balik ke halaman login
      if (token == null || token.isEmpty) {
        _handleLogout();
        return;
      }

      // 2. Tembak API Get Profile
      final data = await ProfileApi.getProfile(token);

      setState(() {
        _profileData = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceAll("Exception: ", "");
        _isLoading = false;
      });
    }
  }

  Future<void> _handleLogout() async {
    // Hapus token biar gak bisa masuk tanpa login lagi
    await PreferenceHandler.removeToken();

    if (mounted) {
      // Pindah ke Login dan hapus semua history layar sebelumnya
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Profil Saya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // --- STATE 1: SEDANG LOADING ---
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF2563EB)),
      );
    }

    // --- STATE 2: ERROR (MISAL TOKEN EXPIRED/MATI LAMPU) ---
    if (_errorMessage.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 60, color: Colors.red.shade300),
              const SizedBox(height: 16),
              Text(
                _errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _fetchProfileData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                ),
                child: const Text(
                  "Coba Lagi",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: _handleLogout,
                child: const Text(
                  "Kembali ke Login",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // --- STATE 3: DATA BERHASIL DIAMBIL ---
    final user = _profileData?.data;
    if (user == null) return const Center(child: Text("Data tidak ditemukan"));

    return RefreshIndicator(
      onRefresh: _fetchProfileData, // Bisa ditarik ke bawah buat refresh
      color: const Color(0xFF2563EB),
      child: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          // --- BAGIAN FOTO & NAMA ---
          Center(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF), // Biru sangat muda
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFBFDBFE),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      user.name!
                          .substring(0, 1)
                          .toUpperCase(), // Ambil inisial huruf pertama
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  user.name ?? "Tidak ada nama",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email ?? "Tidak ada email",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: user.emailVerifiedAt != null
                        ? Colors.green.shade50
                        : Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    user.emailVerifiedAt != null
                        ? "Email Terverifikasi"
                        : "Belum Verifikasi",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: user.emailVerifiedAt != null
                          ? Colors.green.shade700
                          : Colors.orange.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // --- MENU PENGATURAN ---
          const Text(
            "Pengaturan Akun",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF334155),
            ),
          ),
          const SizedBox(height: 16),

          // Tombol Edit Profil
          _buildMenuCard(
            icon: Icons.person_outline,
            title: "Ubah Profil",
            subtitle: "Perbarui nama dan data diri",
            iconColor: const Color(0xFF2563EB),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(
                    currentName: user.name ?? "",
                    // currentEmail: user.email ?? "",
                  ),
                ),
              ).then((value) {
                // Kalau berhasil simpan (dapat true), refresh layar profil
                if (value == true) _fetchProfileData();
              });
            },
          ),
          const SizedBox(height: 12),

          // Tombol Logout
          _buildMenuCard(
            icon: Icons.logout,
            title: "Keluar Aplikasi",
            subtitle: "Hapus sesi perangkat ini",
            iconColor: Colors.redAccent,
            isDestructive: true,
            onTap: _handleLogout,
          ),
        ],
      ),
    );
  }

  // Widget kecil biar menu rapi kayak aplikasi kantoran
  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(16),
          color: isDestructive
              ? Colors.red.shade50.withOpacity(0.5)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDestructive
                          ? Colors.redAccent
                          : const Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
