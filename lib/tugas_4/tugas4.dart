import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Jamaah"), backgroundColor: Colors.green),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Tambah jamaah",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              labelText: "Nama",
              filled: true,
              fillColor: Colors.grey[200],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              labelText: "Email",
              filled: true,
              fillColor: Colors.grey[200],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              labelText: "No HP",
              filled: true,
              fillColor: Colors.grey[200],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              labelText: "Kelas Pilihan",
              filled: true,
              fillColor: Colors.grey[200],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 25),

          Text(
            "Daftar Jamaah",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Fulan"),
            subtitle: Text("Kelas Samawa"),
          ),

          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Fulanah"),
            subtitle: Text("Kelas Samawa"),
          ),

          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Fulan bin fulan"),
            subtitle: Text("Kelas Samawa"),
          ),

          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Koirul"),
            subtitle: Text("Kelas Samawa"),
          ),

          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Anam"),
            subtitle: Text("Kelas Samawa"),
          ),
          
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Pajero"),
            subtitle: Text("Kelas Samawa"),
          )
          // ListTile()
        ],
      ),
    );
  }
}
