import 'package:flutter/material.dart';
import 'package:masters_india/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
          bodyText2: TextStyle(fontSize: 16.0, color: Colors.black),
          subtitle1: TextStyle(fontSize: 14, color: Color(0xff2DA05E),)
        ),

      ),
      home: SafeArea(child: HomeScreen()),
    );
  }
}


