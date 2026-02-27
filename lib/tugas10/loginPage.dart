import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas10/homePage.dart';

class LoginPage extends StatefulWidget {
  final String nama;
  final String kelas;
  final String email;
  final String password;

  const LoginPage({
    super.key,
    required this.nama,
    required this.kelas,
    required this.email,
    required this.password,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F3D2E),
      appBar: AppBar(
        backgroundColor: Color(0xFF145A32),
        foregroundColor: Colors.white,
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Silakan Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF145A32),
                      ),
                    ),
                    SizedBox(height: 20),

                    // EMAIL
                    TextFormField(
                      controller: emailLoginController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email wajib diisi";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 15),

                    // PASSWORD
                    TextFormField(
                      controller: passwordLoginController,
                      obscureText: !isVisibility,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisibility
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isVisibility = !isVisibility;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password wajib diisi";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 25),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F7A5C),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (emailLoginController.text == widget.email &&
                              passwordLoginController.text == widget.password) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  nama: widget.nama,
                                  kelas: widget.kelas,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Email atau Password salah!"),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        "Masuk",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
