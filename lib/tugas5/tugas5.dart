import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool tampilNama = false;
  bool disukai = false;
  bool tampilDetail = false;
  bool tampilKotakText = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Profil"),
        backgroundColor: const Color.fromARGB(255, 87, 86, 86),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            ElevatedButton(
              onPressed: () {
                setState(() {
                  tampilNama = !tampilNama;
                });
              },
              child: Text("Tampilkan Nama"),
            ),

            if (tampilNama) Text("Nama saya: Shafiq"),

            SizedBox(height: 20),   

            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.save,
                    color: disukai ? const Color.fromARGB(255, 39, 216, 3) : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      disukai = !disukai;
                    });
                  },
                ),
                if (disukai) Text("Disimpan"),
              ],
            ),

            SizedBox(height: 20),

            TextButton(
              onPressed: () {
                setState(() {
                  tampilDetail = !tampilDetail;
                });
              },
              child: Text(tampilDetail ? "Tutup Detail" : "Lihat Selengkapnya"),
            ),

            if (tampilDetail)
              Text(
                "Kegiatan ta'lim ini bertujuan untuk meningkatkan "
                "pemahaman agama dan membangun kebersamaan jamaah.",
              ),

            SizedBox(height: 20),

            Center(
              child: InkWell(
                splashColor: Colors.amber,
                onTap: () {
                  setState(() {
                    tampilKotakText = !tampilKotakText;
                  });
                  // print("Kotak berhasil diklik!");
                },
                
                child: Container(
                  width: 100,
                  height: 80,
                  // color: Colors.green.shade200,
                  alignment: Alignment.center,
                  child: Text("Klik!"),
                ),
              ),
            ),

            if (tampilKotakText) Text("Sudah diklik!"),

            SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                setState(() {
                  counter += 1;
                });
              },
              onDoubleTap: () {
                setState(() {
                  counter += 2;
                });
              },
              onLongPress: () {
                setState(() {
                  counter += 3;
                });
              },
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: const Color.fromARGB(255, 39, 75, 22),
                  alignment: Alignment.center,
                  child: Text(
                    "$counter",
                    style: TextStyle(fontSize: 18)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 112, 114, 112),
        child: Icon(Icons.remove),
        onPressed: () {
          setState(() {
            counter -= 1;
          });
        },
      ),
    );
  }
}

class Tugas5Flutter extends StatelessWidget {
  const Tugas5Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
