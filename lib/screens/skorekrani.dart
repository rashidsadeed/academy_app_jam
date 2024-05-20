import 'package:flutter/material.dart';

class ScoreBoardScreen extends StatefulWidget {
  const ScoreBoardScreen({super.key});

  @override
  State<ScoreBoardScreen> createState() => _ScoreBoardScreenState();
}


class _ScoreBoardScreenState extends State<ScoreBoardScreen> {

  final person_list = ["Zeynep", "Raşid", "Emre", "Sude"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 100, // adjust as needed
                width: 100, // adjust as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/owl.png'), // replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 100, // adjust as needed
                width: 100, // adjust as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/owl.png'), // replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 100, // adjust as needed
                width: 100, // adjust as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/owl.png'), // replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 150),
                child: ListView.builder(
                  itemCount: person_list.length, // replace with your number of categories
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${index + 1} -- ${person_list[index]}'),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
