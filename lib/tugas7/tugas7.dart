import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas7/checkbox.dart';
import 'package:belajar_flutter/tugas7/datePicker.dart';
import 'package:belajar_flutter/tugas7/dropdown.dart';
import 'package:belajar_flutter/tugas7/switch.dart';
import 'package:belajar_flutter/tugas7/timePicker.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  int pilihMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6CA651),
        title: Text("Tugas 7"),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              child: Center(child: DrawerHeader(child: Text("Menu"))),
              color: const Color(0xff6CA651),
            ),

            listMenu("Checkbox", 0),
            listMenu("Switch", 1),
            listMenu("Dropdown", 2),
            listMenu("Tanggal", 3),
            listMenu("Jam", 4),
          ],
        ),
      ),

      body: Center(child: getPage()),
    );
  }

  // tombol drawer
  Widget listMenu(String title, int index) {
    return ListTile(
      title: Text(title),
      onTap: () {
        setState(() {
          pilihMenu = index;
        });
        Navigator.pop(context);
      },
    );
  }

  // ganti halaman
  Widget getPage() {
    switch (pilihMenu) {
      case 0:
        return CheckboxPage();
      case 1:
        return SwitchPage();
      case 2:
        return DropdownPage();
      case 3:
        return DatePickerPage();
      case 4:
        return TimePickerPage();
      default:
        return Center(child: Text("Pilih menu"));
    }
  }
}
