import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {

  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDark ? Colors.black : Colors.white,

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Mode Gelap"),

            Switch(
              value: isDark,
              onChanged: (val) {
                setState(() {
                  isDark = val;
                });
              },
            ),

            Text(
              isDark ? "Mode Gelap Aktif" : "Mode Terang Aktif",
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}