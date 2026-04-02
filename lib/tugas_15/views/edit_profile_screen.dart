import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas_15/api/profile_api.dart';
import 'package:belajar_flutter/tugas_15/database/preference.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  // final String currentEmail;

  const EditProfileScreen({
    super.key,
    required this.currentName,
    // required this.currentEmail,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Otomatis isi kotak input dengan data lama
    _nameController = TextEditingController(text: widget.currentName);
    // _emailController = TextEditingController(text: widget.currentEmail);
  }

  Future<void> _handleUpdate() async {
    // Validasi input: CUKUP CEK NAMA AJA, email dihapus dari pengecekan
    if (_nameController.text.isEmpty) {
      _showSnackbar("Nama tidak boleh kosong!", Colors.redAccent);
      return;
    }

    setState(() => _isLoading = true);

    try {
      // 1. Ambil token dari lokal
      String? token = await PreferenceHandler.getToken();
      if (token == null || token.isEmpty) {
        throw Exception("Sesi telah habis, silakan login ulang.");
      }

      // 2. Tembak API PUT
      await ProfileApi.updateProfile(
        token: token,
        newName: _nameController.text.trim(),
        // Kasih string kosong aja ("") buat ngakalin parameter API-nya
        // karena email dianggep gada
        newEmail: "",
      );

      _showSnackbar("Profil berhasil diperbarui!", Colors.green);

      // 3. Kembali ke layar sebelumnya (ProfileScreen) sambil bawa pesan "true"
      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      String errorMsg = e.toString().replaceAll("Exception: ", "");
      _showSnackbar(errorMsg, Colors.redAccent);
    } finally {
      if (mounted) setState(() => _isLoading = false);
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
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Ubah Profil",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black87,
              size: 20,
            ),
            onPressed: () =>
                Navigator.pop(context, false), // Balik tanpa refresh
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Perbarui Data Diri",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E293B),
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Pastikan nama dan email yang Anda masukkan sudah benar.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),

                // --- FORM NAMA BARU ---
                _buildLabel("Nama Lengkap"),
                TextField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: _customInputDecoration(
                    hintText: "Contoh: Budi Santoso",
                    icon: Icons.person_outline,
                  ),
                ),
                const SizedBox(height: 24),

                // // --- FORM EMAIL BARU ---
                // _buildLabel("Alamat Email"),
                // TextField(
                //   controller: _emailController,
                //   keyboardType: TextInputType.emailAddress,
                //   decoration: _customInputDecoration(
                //     hintText: "nama@email.com",
                //     icon: Icons.email_outlined,
                //   ),
                // ),
                // const SizedBox(height: 48),

                // --- TOMBOL SIMPAN ---
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleUpdate,
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
                            "Simpan Perubahan",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
    );
  }
}
