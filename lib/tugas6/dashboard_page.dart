import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas6/login_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Kembali"),
          ),

          SizedBox(height: 15),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
            child: Text("Push ke Login"),
          ),

          SizedBox(height: 15),

          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
            child: Text("Replace ke Login"),
          ),

          SizedBox(height: 15),

          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
                (route) => false,
              );
            },
            child: Text("Reset ke Login"),
          ),
        ],
      ),
    );
  }
}
