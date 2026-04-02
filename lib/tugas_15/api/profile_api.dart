import 'dart:convert';
import 'package:http/http.dart' as http;

// WAJIB IMPORT INI: Panggil endpoint dan model profile-nya
import 'package:belajar_flutter/tugas_15/api/endpoint.dart';
import 'package:belajar_flutter/tugas_15/models/profile_model.dart';

class ProfileApi {
  // --- FUNGSI GET PROFILE ---
  static Future<ProfileModel> getProfile(String token) async {
    final response = await http.get(
      Uri.parse(Endpoint.profile),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token", // Ingat, pakai Bearer sesuai Postman
      },
    );

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal mengambil data profil. Sesi mungkin telah habis.");
    }
  }

  // --- FUNGSI UPDATE PROFILE ---
  static Future<ProfileModel> updateProfile({
    required String token,
    required String newName,
    required String newEmail,
  }) async {
    final response = await http.put(
      Uri.parse(Endpoint.profile),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
      // Sesuai postman, update butuh name dan email
      body: {"name": newName, "email": newEmail},
    );

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error['message'] ?? "Gagal mengupdate profil");
    }
  }
}
