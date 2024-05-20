import 'package:academy1/screens/girisekrani.dart';
import 'package:flutter/material.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({super.key});

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}


class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  String userName = 'Murat'; // replace with the actual user name

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            ElevatedButton(
              onPressed: () {
                // handle button press to change photo
              },
              child: Text('Change Photo'),
            ),
            SizedBox(height: 20), // adjust as needed
            Text(userName),
            ElevatedButton(
              onPressed: () {
                // handle button press to change name
              },
              child: Text('Change Name'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginWidget()),
                );
              },
              child: Text('Log Off'),
            ),
            SizedBox(height: 20), // adjust as needed
          ],
        ),
      ),
    );
  }
}
