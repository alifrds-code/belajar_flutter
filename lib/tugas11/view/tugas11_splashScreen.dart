import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas11/database/preference.dart';
import 'package:belajar_flutter/tugas10/homePage.dart';
import 'package:belajar_flutter/tugas10/tugas10.dart';
import 'package:belajar_flutter/extension/navigator.dart';

class Tugas11Splashscreen extends StatefulWidget {
  const Tugas11Splashscreen({super.key});

  @override
  State<Tugas11Splashscreen> createState() => _Tugas11SplashscreenState();
}

class _Tugas11SplashscreenState extends State<Tugas11Splashscreen> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    bool? data = await PreferenceHandler.getIsLogin();
    print(data);
    print("Hai, Joshua");
    if (data == true) {
      context.pushAndRemoveAll(
        HomePage(nama: "User", kelas: "Tidak diketahui"),
      );
    } else {
      context.pushAndRemoveAll(Tugas11Splashscreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset("assets/images/logoAlFalah.png")],
      ),
    );
  }
}
