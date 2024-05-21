import 'dart:math';
import 'dart:async'; // Zamanlayıcı işlemleri için dart:async paketini ekliyoruz

import 'package:academy1/screens/anaekran.dart';
import 'package:flutter/material.dart';
import 'package:academy1/screens/sonucekrani.dart'; // Sonuç ekranının import edilmesi


int correctAnswers = 0; // replace with the actual number of correct answers
int incorrectAnswers = 0; // replace with the actual number of incorrect answers
int totalScore = 0; // replace with the actual total score
String reward = 'Gold Medal'; // replace with the actual reward

class QuestionsPageWidget extends StatefulWidget {
  const QuestionsPageWidget({Key? key}) : super(key: key);

  @override
  State<QuestionsPageWidget> createState() => _QuestionsPageWidgetState();
}

class _QuestionsPageWidgetState extends State<QuestionsPageWidget> {
  int currentQuestionIndex = 0; // Şu anki sorunun dizinini takip etmek için bir değişken
  bool? isAnswerCorrect;

  void answerController(String cevap, int soruIndex)
  {
    bool? temp = sorular[soruIndex].secenekler[cevap];
    if(temp != null)
      {
        Random random = Random();

        if(temp)
          {
            //true ise
            correctAnswers++;
            totalScore += 20 + random.nextInt(21);

          }
        else
          {
            incorrectAnswers++;
            if(totalScore >= 0)
              totalScore -= 10 + random.nextInt(11);
            else
              totalScore = 0;
          }


      }
    print("Correct: $correctAnswers, incorrect: $incorrectAnswers, total: $totalScore");

    print("Tıklanan seçenek: $cevap, Soru İndeksi: $soruIndex, Soru Doğru Mu : $temp");
  }
  @override
  Widget build(BuildContext context) {


    if (currentQuestionIndex >= sorular.length) {

      if(correctAnswers > 2)
        reward = 'Gold Medal';
      else
        reward = 'Bronz Medal';

      // Eğer soruların sonuna ulaşıldıysa sonuç ekranına yönlendir
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ResultsPageWidget()));
      });

      currentQuestionIndex = 0;

    }

    Soru currentQuestion = sorular[currentQuestionIndex];
    String question = currentQuestion.soruMetni;
    List<String> options = currentQuestion.secenekler.keys.toList();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200, // Adjust as needed
              width: 200, // Adjust as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/owl.png'), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20), // Adjust as needed
            Text(question),
            SizedBox(height: 20), // Adjust as needed
            ...options.map((option) => ElevatedButton(
              onPressed: () {
                setState(() {
                  answerController(option, currentQuestionIndex);

                  currentQuestionIndex++;
                });
              },
              child: Text(option),
            )).toList(),
          ],
        ),
      ),
    );
  }
}
