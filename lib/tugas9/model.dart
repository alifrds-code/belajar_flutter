import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas9/dataModel.dart';

class ModelPage extends StatelessWidget {
  const ModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clubList.length,
      itemBuilder: (context, index) {
        final club = clubList[index];

        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Image.network(
              club.foto,
              width: 50,
              height: 50,
            ),
            title: Text(
              club.nama,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Negara: ${club.negara}\nUCL: ${club.jumlahUCL}",
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}