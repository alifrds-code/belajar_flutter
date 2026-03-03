import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas12/database/sqflite.dart';
import 'package:belajar_flutter/tugas12/models/user_model.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  void _register() async {
    if (_emailCtrl.text.isNotEmpty && _passwordCtrl.text.isNotEmpty) {
      final newUser = UserModel(
        email: _emailCtrl.text,
        password: _passwordCtrl.text,
      );
      await DBHelper.registerUser(newUser);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Berhasil daftar! Silakan login.")),
      );
      Navigator.pop(context); // Kembali ke halaman login
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Form tidak boleh kosong!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Akun"), backgroundColor: Colors.teal),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailCtrl,
              decoration: InputDecoration(
                labelText: 'Email Baru',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _passwordCtrl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password Baru',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.teal,
              ),
              child: Text("DAFTAR"),
            ),
          ],
        ),
      ),
    );
  }
}
