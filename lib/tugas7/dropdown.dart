import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          DropdownButton<String>(
            value: selected,
            hint: Text("Pilih kategori"),
            items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                selected = val;
              });
            },
          ),

          Text(
            selected == null ? "" : "Anda memilih: $selected",
          ),
        ],
      ),
    );
  }
}
