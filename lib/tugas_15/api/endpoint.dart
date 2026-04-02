class Endpoint {
  static const String baseUrl = "https://absensib1.mobileprojp.com/api";

  // Endpoint untuk tiap fitur sesuai Postman
  static const String register = "$baseUrl/register";
  static const String login = "$baseUrl/login";
  static const String profile =
      "$baseUrl/profile"; // Dipakai buat GET (ambil data) dan PUT (edit data)
}
