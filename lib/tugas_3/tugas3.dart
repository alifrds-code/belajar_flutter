import 'package:flutter/material.dart';

class Tugas3Flutter extends StatelessWidget {
  const Tugas3Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form input jamaah"),
        backgroundColor: Colors.green,
      ),

      // Scroll
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FORM INPUT DATA
              Text(
                "Input Data Jamaah",
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
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Alamat",
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 30),

              Text(
                "List Materi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),

              GridView.count(
                crossAxisCount: 2, // 2 kolom

                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                crossAxisSpacing: 10,
                mainAxisSpacing: 10,

                children: List.generate(6, (index) {
                  // Stack untuk tumpuk label
                  return Stack(
                    children: [
                      // Background kotak warna
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                        ),
                      ),

                      // Label di atas kotak
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          color: const Color.fromARGB(137, 72, 241, 72),
                          child: Text(
                            "Pekan ${index + 1}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
