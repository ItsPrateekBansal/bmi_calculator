import 'package:flutter/material.dart';
import 'package:bmi_calculator/_input_page.dart';
// import 'package:bmi_calculator/result_screen.dart';

void main() => runApp(BMIApp());

class BMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
