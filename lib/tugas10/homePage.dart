import 'package:flutter/material.dart';
// import 'package:belajar_flutter/tugas11/database/preference.dart';
// import 'package:belajar_flutter/tugas11/view/tugas11_splashScreen.dart';
import 'package:belajar_flutter/tugas10/tugas10.dart';


class HomePage extends StatelessWidget {
  final String nama;
  final String kelas;
  const HomePage({super.key, required this.nama, required this.kelas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F3D2E),
      appBar: AppBar(
        backgroundColor: Color(0xFF145A32),
        foregroundColor: Colors.white,
        title: Text("Konfirmasi"),
      ),
      body: Center(
        child: Text(
          "Terima kasih, $nama dari $kelas telah mendaftar.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
