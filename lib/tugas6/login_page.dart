import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/logoAlFalah.png"),
                
              ),
            ),
            
            SizedBox(height: 20),
                
            Text(
              "Assalamulaikum",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
                
            SizedBox(height: 30),
                
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
                
            SizedBox(height: 15),
                
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
                
            SizedBox(height: 10),
                
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot password?",
                style: TextStyle(color: Colors.blue),
              ),
            ),
                
            SizedBox(height: 20),
                
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DashboardPage()),
                  );
                },
                child: Text("Login"),
              ),
            ),
                
            SizedBox(height: 10),
                
          ],
        
      ),
    );
  }
}
