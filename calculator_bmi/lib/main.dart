import 'package:calculator_bmi/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
