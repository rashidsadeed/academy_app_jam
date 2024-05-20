import 'package:academy1/screens/ayarlarekrani.dart';
import 'package:academy1/screens/skorekrani.dart';
import 'package:academy1/screens/soruekrani.dart';
import 'package:flutter/material.dart';

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

class HomeScreen extends StatelessWidget {
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
        Expanded(
          child: ListView(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuestionsPageWidget()),
                  );
                },
                icon: Icon(Icons.sports),
                  label: Text('Spor'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // handle button press to change name
                },
                icon: Icon(Icons.science),
                label: Text('Bilim'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // handle button press to change name
                },
                icon: Icon(Icons.people),
                label: Text('Genel Kultur'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // handle button press to change name
                },
                icon: Icon(Icons.book),
                label: Text('Tarih'),
              ),]
          ),
        ),

      ],
    );
  }
}