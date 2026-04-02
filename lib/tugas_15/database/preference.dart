import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static const String tokenKey = "TOKEN_KEY";

  // Fungsi buat nyimpen token pas berhasil login
  static Future<void> storingToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  // Fungsi buat ngambil token (dipakai pas Get Profile & Edit Profile)
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  // Fungsi buat hapus token pas Logout
  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }
}
