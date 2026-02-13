import 'package:flutter/material.dart';

class Tugas2Flutter extends StatelessWidget {
  Tugas2Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Soal 1
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 77, 8),
        title: Text(
          "Profil Kelas Ta'lim",
          style: TextStyle(color: Color.fromARGB(249, 255, 255, 255)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Soal 2
          SizedBox(height: 15),
          Center(
            child: Text(
              "Ta'lim Samawa",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // Soal 3
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.green),
                SizedBox(width: 6),
                Text(
                  "Yayasan Al - Falah, Jakarta Utara",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(Icons.email, color: Colors.green),
                SizedBox(width: 6),
                Text("alfalah@email.com", style: TextStyle(fontSize: 15)),

                Spacer(),

                Icon(Icons.phone, color: Colors.green),
                SizedBox(width: 6),
                Text("08123456789", style: TextStyle(fontSize: 15)),
              ],
            ),
          ),

          SizedBox(height: 15),

          // Soal 4
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.green.shade100),
                    child: Column(
                      children: [
                        Icon(Icons.people, color: Colors.green, size: 30),
                        SizedBox(height: 10),
                        Text(
                          "5",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Jamaah"),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 15),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.green.shade100),
                    child: Column(
                      children: [
                        Icon(Icons.menu_book, color: Colors.green, size: 30),
                        SizedBox(height: 10),
                        Text(
                          "2x",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Per Minggu"),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 15),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.green.shade100),
                    child: Column(
                      children: [
                        Icon(Icons.schedule, color: Colors.green, size: 30),
                        SizedBox(height: 10),
                        Text(
                          "16.00",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Waktu"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),
          // Soal 5
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Kelas Ta'lim Samawa adalah wadah pembelajaran "
              "ilmu Tauhid yang diadakan setiap 2 kali seminggu. ",
              textAlign: TextAlign.justify,
            ),
          ),
          Spacer(),
          // Soal 6
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 60,
            child: Center(child: Image.asset("assets/images/vini.jpg")),
          ),
        ],
      ),
    );
  }
}
