import 'package:flutter/material.dart';
// import '../database/sqflite.dart';
import '../models/jamaah_model.dart';
import 'package:belajar_flutter/tugas11p2/database/controller.dart';

class DataJamaahScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Jamaah Terdaftar"),
        backgroundColor: Colors.teal,
      ),
      // FutureBuilder otomatis mengambil data dari database
      body: FutureBuilder<List<JamaahModel>>(
        future: JamaahController.getJamaahList(),
        builder: (context, snapshot) {
          // 1. Kalau lagi proses ambil data, tampilin loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // 2. Kalau datanya kosong
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Belum ada data jamaah."));
          }

          // 3. Kalau datanya ada, masukkan ke dalam List
          final dataJamaah = snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: dataJamaah.length,
            itemBuilder: (context, index) {
              final jamaah = dataJamaah[index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    jamaah.nama,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Alamat: ${jamaah.alamat}\nNo HP: ${jamaah.noHp}",
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
