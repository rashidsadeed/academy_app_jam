import 'dart:io';

import 'package:academy1/screens/ayarlarekrani.dart';
import 'package:academy1/screens/skorekrani.dart';
import 'package:academy1/screens/soruekrani.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

List<Soru> sorular = [];
class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}


class _HomePageWidgetState extends State<HomePageWidget> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ScoreBoardScreen(),
    SettingsPageWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bilge Baykusu'), // replace with your title
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scoreboard),
            label: 'Score Board',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class Soru {
  String soruMetni;
  Map<String, bool> secenekler;

  Soru(this.soruMetni, this.secenekler);
}

class HomeScreen extends StatelessWidget {

  void GeminiQuestionCreator (String name, BuildContext context) async
  {
    sorular.clear();
    print("Gemini Creator : $name");

    final apiKey = "AIzaSyDAohfXF7DA9LqDiCewX1d3_MapmAfFFrg";
  if (apiKey == null) {
    print('No \$API_KEY environment variable');
    exit(1);
  }
  String kategori = name;
  // For text-only input, use the gemini-pro model
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final content = [Content.text("""$kategori ile ilgili 5 tane soru yaz. 
    4 şıkkı ve bir doğru cevabı olsun. 
    soru en fazla 50 karakter olsun ve cevaplar direkt kelimeler şeklinde olsun. 
    Doğru cevap D şıkkından sonraki satırda olsun. 
    Yazılışı da "Cevap: (doğru cevap(şık değil metin))" olsun. 
    Genel olarak şu şekilde olsun: Süper Lig'in şu anki şampiyonu hangi takımdır?
      (A) Fenerbahçe
    (B) Trabzonspor
    (C) Galatasaray
    (D) Beşiktaş
  Cevap: Fenerbahçe""")];
  final response = await model.generateContent(content);
  String? yeniVeri = response.text;
  print(yeniVeri);
  final lines = yeniVeri.toString().split('\n');


    for (var i = 0; i < lines.length; i++) {
      if (lines[i].contains("?")) {
        final soruMetni = lines[i].trim();

        final secenekler = {
          lines[i + 1].trim().substring(4): false,
          lines[i + 2].trim().substring(4): false,
          lines[i + 3].trim().substring(4): false,
          lines[i + 4].trim().substring(4): false,
        };

        final dogruCevap = lines[i + 5].split(": ")[1].trim();
        secenekler[dogruCevap] = true;

        final soru = Soru(soruMetni, secenekler);
        sorular.add(soru);
      }
    }

    for (var i = 0; i < sorular.length; i++) {
      print("${sorular[i].soruMetni}");
      sorular[i].secenekler.forEach((secenek, dogruMu) {
        if (dogruMu) {
          print("$secenek Doğru");
        } else {
          print("$secenek Yanlış");
        }
      });
    }



    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuestionsPageWidget()),
    );




  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200, // adjust as needed
          width: double.infinity, // adjust as needed
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/owl.png'), // replace with your image
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20), // Add space between the image and buttons
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(10.0), // Add padding to the list
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuestionsPageWidget()),
                  );*/
                  GeminiQuestionCreator('Spor',context);

                },
                icon: Icon(Icons.sports),
                label: Text('Spor'),
              ),
              SizedBox(height: 10), // Add space between buttons
              ElevatedButton.icon(
                onPressed: () {
                  GeminiQuestionCreator('Bilim',context);
                  // handle button press to change name
                },
                icon: Icon(Icons.science),
                label: Text('Bilim'),
              ),
              SizedBox(height: 10), // Add space between buttons
              ElevatedButton.icon(
                onPressed: () {
                  GeminiQuestionCreator('Genel Kultur',context);

                  // handle button press to change name
                },
                icon: Icon(Icons.people),
                label: Text('Genel Kultur'),
              ),
              SizedBox(height: 10), // Add space between buttons
              ElevatedButton.icon(
                onPressed: () {
                  GeminiQuestionCreator('Tarih',context);

                  // handle button press to change name
                },
                icon: Icon(Icons.book),
                label: Text('Tarih'),
              ),
              SizedBox(height: 10), // Add space between buttons
              ElevatedButton.icon(
                onPressed: () {
                  GeminiQuestionCreator('Teknoloji',context);

                  // handle button press to change name
                },
                icon: Icon(Icons.computer),
                label: Text('Teknoloji'),
              ),
              SizedBox(height: 10), // Add space between buttons
              ElevatedButton.icon(
                onPressed: () {
                  GeminiQuestionCreator('İngilizce',context);

                  // handle button press to change name
                },
                icon: Icon(Icons.language),
                label: Text('İngilizce'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
