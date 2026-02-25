import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final List<String> dataSesuatu = [
    "Real Madrid",
    "Barcelona",
    "King Emyu",
    "Liverpool",
    "Chelsea",
    "Bayern Munich",
    "PSG",
    "Juventus",
    "AC Milan",
    "Arsenal",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataSesuatu.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(dataSesuatu[index]),
          ),
        );
      },
    );
  }
}
