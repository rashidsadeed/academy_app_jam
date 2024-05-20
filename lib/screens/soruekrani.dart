import 'package:academy1/screens/sonucekrani.dart';
import 'package:flutter/material.dart';

class QuestionsPageWidget extends StatefulWidget {
  const QuestionsPageWidget({super.key});

  @override
  State<QuestionsPageWidget> createState() => _QuestionsPageWidgetState();
}


class _QuestionsPageWidgetState extends State<QuestionsPageWidget> {
  String question = 'Question goes here'; // replace with the actual question
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4']; // replace with the actual options

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
            SizedBox(height: 20), // adjust as needed
            Text(question),
            SizedBox(height: 20), // adjust as needed
            ...options.map((option) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResultsPageWidget()),
                );
              },
              child: Text(option),
            )).toList(),
          ],
        ),
      ),
    );
  }
}
