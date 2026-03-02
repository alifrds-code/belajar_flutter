import 'package:flutter/material.dart';
import 'package:belajar_flutter/utils/decoration_form.dart';

class _CrSiswaScreen extends StatefulWidget {
  const _CrSiswaScreen({super.key});

  @override
  State<_CrSiswaScreen> createState() => __CrSiswaScreenState();
}

class __CrSiswaScreenState extends State<_CrSiswaScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: namaController,
              decoration: decorationConstant(hintText: "Masukkan nama"),
            ),
            TextFormField(
              controller: kelasController,
              decoration: decorationConstant(hintText: "Masukkan kelas"),
            ),
          ],
        ),
      ),
    );
  }
}
