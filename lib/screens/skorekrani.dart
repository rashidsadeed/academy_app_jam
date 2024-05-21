import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScoreBoardScreen extends StatefulWidget {
  const ScoreBoardScreen({super.key});

  @override
  State<ScoreBoardScreen> createState() => _ScoreBoardScreenState();
}


class _ScoreBoardScreenState extends State<ScoreBoardScreen> {

  final person_list = ["Zeynep", "Raşid", "Murat", "Emre"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    height: 100, // adjust as needed
                    width: 100, // adjust as needed
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/owl.png'), // replace with your image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text("Raşid"),
                ],
              ),
              Column(
                  children:[
                    Container(
                      height: 150, // adjust as needed
                      width: 100, // adjust as needed
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/owl.png'), // replace with your image

                          fit: BoxFit.cover,
                        ),
                      ),

                    ),
                    const Text("Zeynep")
                  ]
              ),
              Column(
                children: [
                  Container(
                    height: 100, // adjust as needed
                    width: 100, // adjust as needed
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/owl.png'), // replace with your image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text("Murat")
                ],
              ),
            ],
          ),
          const SizedBox(height: 20), // adjust as needed
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 150),
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