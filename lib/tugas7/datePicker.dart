import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {

  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2070),
              );

              if (picked != null) {
                setState(() {
                  selectedDate = picked;
                });
              }
            },
            child: Text("Pilih Tanggal"),
          ),

          Text(
            selectedDate == null
                ? ""
                : "Tanggal Pilihan: ${DateFormat('dd MMMM yyyy').format(selectedDate!)}"
                // : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
          ),
        ],
      ),
    );
  }
}