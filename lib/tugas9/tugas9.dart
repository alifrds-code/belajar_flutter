import 'package:belajar_flutter/tugas9/list.dart';
import 'package:belajar_flutter/tugas9/list_map.dart';
import 'package:belajar_flutter/tugas9/model.dart';
import 'package:flutter/material.dart';

class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});

  @override
  State<Tugas9> createState() => _Tugas9State();
}

class _Tugas9State extends State<Tugas9> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    ListPage(),
    ListMapPage(),
    ModelPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 37, 48),
        title: Text(
          "TUGAS SEMBILAN 9 IX ٩",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          
        ),
        centerTitle: true,
      ),

      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Color.fromARGB(255, 30, 37, 48),
        unselectedItemColor: const Color.fromARGB(255, 102, 102, 102),
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Model",
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "WELCOME TO THE CLUB",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}