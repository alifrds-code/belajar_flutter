import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas11p2/views/inputJamaah.dart';

class HomePage extends StatefulWidget {
  // Bikin variabel buat nangkep email dari halaman Login
  final String userEmail;
  HomePage({required this.userEmail});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [_buildHomeView(), InputJamaahView()];

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? "Home" : "Input Jamaah"),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Cek kita lagi di tab mana
            if (_currentIndex == 1) {
              // Kalau lagi di tab Input Jamaah (index 1), balik ke tab Home (index 0)
              setState(() {
                _currentIndex = 0;
              });
            } else {
              // Kalau udah di tab Home pencet back lagi, baru dia Logout ke halaman Login
              Navigator.pushReplacementNamed(context, '/login');
            }
          },
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person_add), label: "Input"),
        ],
      ),
    );
  }

  // Tampilan khusus Tab Home (Cuma ucapan selamat datang)
  Widget _buildHomeView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle, size: 100, color: Colors.teal.shade200),
          SizedBox(height: 20),
          Text(
            "Selamat Datang!",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // Nampilin email yang terdaftar
          Text(
            widget.userEmail,
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
