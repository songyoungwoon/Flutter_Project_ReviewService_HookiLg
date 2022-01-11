import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/screen/Welcome/welcome_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HookiLg',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
