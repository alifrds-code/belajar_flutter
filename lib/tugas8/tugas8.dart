import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas7/tugas7.dart';
import 'package:belajar_flutter/tugas8/about.dart';

class Tugas8 extends StatefulWidget {
  const Tugas8({super.key});

  @override
  State<Tugas8> createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {

  int selectedIndex = 0;

  final List<Widget> pages = [
    Tugas7(), 
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor:  Color(0xff6CA651),
        selectedItemColor: Colors.black,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
      ),
    );
  }
}
