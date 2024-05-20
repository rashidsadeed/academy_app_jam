import 'package:academy1/screens/girisekrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AcademyApp());
}

class AcademyApp extends StatefulWidget {
  const AcademyApp({super.key});

  @override
  State<AcademyApp> createState() => _AcademyAppState();
}

class _AcademyAppState extends State<AcademyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginWidget(),

    );
  }
}

