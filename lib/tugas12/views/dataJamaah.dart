import 'package:belajar_flutter/utils/decoration_form.dart';
import 'package:flutter/material.dart';
// import '../database/sqflite.dart';
import 'package:belajar_flutter/tugas12/models/jamaah_model.dart';
import 'package:belajar_flutter/tugas12/database/controller.dart';
import 'package:belajar_flutter/extension/navigator.dart';

class DataJamaahScreen extends StatefulWidget {
  @override
  State<DataJamaahScreen> createState() => _DataJamaahScreenState();
}

class _DataJamaahScreenState extends State<DataJamaahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Jamaah Terdaftar"),
        backgroundColor: Colors.teal,
      ),

      body: FutureBuilder<List<JamaahModel>>(
        future: JamaahController.getJamaahList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Belum ada data jamaah."));
          }

          final dataJamaah = snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: dataJamaah.length,
            itemBuilder: (context, index) {
              final jamaah = dataJamaah[index];
              return Card(
                elevation: 4,
                shadowColor: Colors.teal.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              jamaah.nama,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Alamat: ${jamaah.alamat}",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "No HP: ${jamaah.noHp}",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),

                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.orange),
                            onPressed: () async {
                              await showEditDialog(context, jamaah);
                              setState(() {});
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await showDeleteDialog(context, jamaah.id!);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> showEditDialog(BuildContext context, JamaahModel jamaah) async {
    final _namaController = TextEditingController(text: jamaah.nama);
    final _emailController = TextEditingController(text: jamaah.email);
    final _noHpController = TextEditingController(text: jamaah.noHp);
    final _alamatController = TextEditingController(text: jamaah.alamat);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Jamaah"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: decorationConstant(hintText: "Nama"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: decorationConstant(hintText: "email"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _noHpController,
                decoration: decorationConstant(hintText: "noHp"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _alamatController,
                decoration: decorationConstant(hintText: "alamat"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (jamaah.id == null) {
                  return;
                }
                await JamaahController.updatejamaah(
                  JamaahModel(
                    id: jamaah.id,
                    nama: _namaController.text,
                    email: _emailController.text,
                    noHp: _noHpController.text,
                    alamat: _alamatController.text,
                  ),
                );
                context.pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Jamaah di update")));
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteDialog(BuildContext context, int id) async {
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah anda yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                context.pop(true);
              },
              child: Text("Hapus"),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      await JamaahController.deletejamaah(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Data berhasil dihapus")));
      setState(() {});
    }
  }
}
