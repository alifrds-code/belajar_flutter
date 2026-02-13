import 'package:flutter/material.dart';

class Day7 extends StatelessWidget {
  const Day7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6CA651),
        title: 
          Text(
            "Profil Saya", style: TextStyle(color: const Color.fromARGB(250, 255, 255, 255))),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama: Faisal Ali Firdaus",
            style: TextStyle(fontSize: 24),
          ),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.red,),
              Text("Jakarta", style: TextStyle(fontSize: 14),),
            ],
          ),
          Text(
            "Seorang pelajar yang sedang belajar flutter"
          ),
          Image.asset("assets/images/vini.jpg")
        ],
        
      ),
    );
  }
}