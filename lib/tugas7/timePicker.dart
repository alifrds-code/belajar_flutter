import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({super.key});

  @override
  State<TimePickerPage> createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (picked != null) {
                setState(() {
                  selectedTime = picked;
                });
              }
            },
            child: Text("Pilih Jam"),
          ),

          Text(
            selectedTime == null
                ? ""
                : "Pengingat diatur pukul: " +
                      DateFormat('hh:mm a').format(
                        DateTime(
                          0,
                          0,
                          0,
                          selectedTime!.hour,
                          selectedTime!.minute,
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
