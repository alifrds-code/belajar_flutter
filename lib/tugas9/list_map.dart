import 'package:flutter/material.dart';

class ListMapPage extends StatefulWidget {
  const ListMapPage({super.key});

  @override
  State<ListMapPage> createState() => _ListMapPageState();
}

class _ListMapPageState extends State<ListMapPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> club = [
      {"nama": "Real Madrid", "icon": Icons.sports_soccer},
      {"nama": "Barcelona", "icon": Icons.sports_soccer},
      {"nama": "King Emyu", "icon": Icons.diamond},
      {"nama": "Liverpool", "icon": Icons.sports_soccer},
      {"nama": "Chelsea", "icon": Icons.sports_soccer},
      {"nama": "Bayern Munich", "icon": Icons.sports_soccer},
      {"nama": "PSG", "icon": Icons.sports_soccer},
      {"nama": "Juventus", "icon": Icons.sports_soccer},
      {"nama": "AC Milan", "icon": Icons.sports_soccer},
      {"nama": "Arsenal", "icon": Icons.emoji_events},
    ];
    return ListView.builder(
      itemCount: club.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Icon(club[index]["icon"]),
            title: Text(club[index]["nama"]),
          ),
        );
      },
    );
  }
}
