import 'package:academy1/screens/anaekran.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200, // adjust as needed
              width: 200, // adjust as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/owl.png'), // replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20), // adjust as needed
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // adjust as needed
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // adjust as needed
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePageWidget()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
