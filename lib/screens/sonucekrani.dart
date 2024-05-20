import 'package:academy1/screens/anaekran.dart';
import 'package:flutter/material.dart';

class ResultsPageWidget extends StatefulWidget {
  const ResultsPageWidget({super.key});

  @override
  State<ResultsPageWidget> createState() => _ResultsPageWidgetState();
}

class _ResultsPageWidgetState extends State<ResultsPageWidget> {
  int correctAnswers = 10; // replace with the actual number of correct answers
  int incorrectAnswers = 5; // replace with the actual number of incorrect answers
  int totalScore = 50; // replace with the actual total score
  String reward = 'Gold Medal'; // replace with the actual reward

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Correct Answers: $correctAnswers'),
            SizedBox(height: 20), // adjust as needed
            Text('Incorrect Answers: $incorrectAnswers'),
            SizedBox(height: 20), // adjust as needed
            Text('Total Score: $totalScore'),
            SizedBox(height: 20), // adjust as needed
            Text('Reward: $reward'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePageWidget()),
                );
              },
              child: Text('Back to Home'),
            ),

          ],
        ),
      ),
    );
  }
}