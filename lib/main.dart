import 'package:flutter/material.dart';
import './loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFFADE28A),
          primaryColorLight: Color(0xFFF0ED86),
          primaryColorDark: Color(0xFF256670)),
      title: 'Flutter Demo',
      home: Login(),
    );
  }
}
