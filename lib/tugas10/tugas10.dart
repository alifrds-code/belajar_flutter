import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas10/homePage.dart';

class Tugas10 extends StatefulWidget {
  Tugas10({super.key});

  @override
  State<Tugas10> createState() => _Tugas10State();
}

class _Tugas10State extends State<Tugas10> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 10 - Registrasi"),
        backgroundColor: Color(0xFF145A32),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      backgroundColor: Colors.white,

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Image.asset("assets/images/logoAlFalah.png", height: 170),

                SizedBox(height: 15),

                Card(
                  elevation: 10,
                  color: const Color.fromARGB(179, 216, 216, 216),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Form Registrasi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF145A32),
                            ),
                          ),

                          SizedBox(height: 25),

                          // NAMA
                          TextFormField(
                            controller: namaController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Color(0xFF145A32),
                              ),
                              labelText: "Nama",
                              filled: true,
                              fillColor: Color(0xFFE8F5E9),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama wajib diisi!';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 15),

                          // EMAIL
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color(0xFF145A32),
                              ),
                              labelText: "Email",
                              filled: true,
                              fillColor: Color(0xFFE8F5E9),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email wajib diisi!';
                              }
                              if (!value.contains('@')) {
                                return 'Format email tidak valid!';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 15),

                          // NO HP
                          TextFormField(
                            controller: noHPController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone_outlined,
                                color: Color(0xFF145A32),
                              ),
                              labelText: "No Handphone",
                              filled: true,
                              fillColor: Color(0xFFE8F5E9),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          SizedBox(height: 15),

                          // KELAS
                          TextFormField(
                            controller: kelasController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.class_outlined,
                                color: Color(0xFF145A32),
                              ),
                              labelText: "Kelas",
                              filled: true,
                              fillColor: Color(0xFFE8F5E9),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Kelas wajib diisi!';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 25),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1F7A5C),
                              padding: EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Konfirmasi Data"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Nama: ${namaController.text}"),
                                          Text(
                                            "Email: ${emailController.text}",
                                          ),
                                          Text("No HP: ${noHPController.text}"),
                                          Text(
                                            "Kelas: ${kelasController.text}",
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                              context,
                                            ); // tutup dialog
                                          },
                                          child: Text("Batal"),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF1F7A5C),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                  nama: namaController.text,
                                                  kelas: kelasController.text,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Lanjut",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Text(
                              "Daftar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
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
}
