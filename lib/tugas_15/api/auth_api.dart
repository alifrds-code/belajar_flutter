import 'dart:convert';
import 'package:http/http.dart' as http;

// WAJIB IMPORT INI: Panggil endpoint dan model auth-nya
import 'package:belajar_flutter/tugas_15/api/endpoint.dart';
import 'package:belajar_flutter/tugas_15/models/auth_model.dart';

class AuthApi {
  // --- FUNGSI REGISTER ---
  static Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(Endpoint.register),
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AuthModel.fromJson(json.decode(response.body));
    } else {
      // Tangkap pesan error dari API (misal: "Email sudah terdaftar")
      final error = AuthModel.fromJson(json.decode(response.body));
      throw Exception(error.message ?? "Gagal melakukan registrasi");
    }
  }

  // --- FUNGSI LOGIN ---
  static Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(Endpoint.login),
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );

    if (response.statusCode == 200) {
      return AuthModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error['message'] ?? "Email atau password salah");
    }
  }
}
