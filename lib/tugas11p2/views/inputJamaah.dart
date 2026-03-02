import 'package:belajar_flutter/tugas11p2/views/dataJamaah.dart';
import 'package:flutter/material.dart';
import '../database/sqflite.dart';
import 'package:belajar_flutter/tugas11p2/models/jamaah_model.dart';
import 'package:belajar_flutter/tugas11p2/database/controller.dart';

class InputJamaahView extends StatefulWidget {
  @override
  _InputJamaahViewState createState() => _InputJamaahViewState();
}

class _InputJamaahViewState extends State<InputJamaahView> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _alamatController = TextEditingController();

  void _simpanData() async {
    if (_formKey.currentState!.validate()) {
      final jamaahBaru = JamaahModel(
        nama: _namaController.text,
        email: _emailController.text,
        noHp: _noHpController.text,
        alamat: _alamatController.text,
      );

      await JamaahController.insertJamaah(jamaahBaru);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Data berhasil disimpan!")));

      _namaController.clear();
      _emailController.clear();
      _noHpController.clear();
      _alamatController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value!.isEmpty ? "Nama tidak boleh kosong" : null,
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              validator: (value) => value!.isEmpty || !value.contains("@")
                  ? "Email tidak valid"
                  : null,
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _noHpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Nomor HP",
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value!.isEmpty ? "Nomor HP tidak boleh kosong" : null,
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _alamatController,
              decoration: InputDecoration(
                labelText: "Alamat",
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value!.isEmpty ? "Alamat tidak boleh kosong" : null,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _simpanData,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.teal,
                    ),
                    child: Text("SIMPAN DATA"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Pindah ke halaman DataJamaahScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataJamaahScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      "LIHAT DATA",
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
