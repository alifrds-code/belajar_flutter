import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  
  bool isCheck = false;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Text("Saya menyetujui semua persyaratan yang berlaku"),
    
        Checkbox(
          value: isCheck, 
          onChanged: (value) {
            setState(() {
              isCheck = value!;
            });
          }
        ),
    
        Text(isCheck? "Lanjutkan Pendaftaran Diperbolehkan" : "Anda belum bisa melanjutkan"),
      ],
    );
  }
}