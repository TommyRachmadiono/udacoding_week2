import 'package:flutter/material.dart';
import 'dart:math';

class ResultPage extends StatelessWidget {
  final int berat, tinggi;
  ResultPage({this.tinggi, this.berat});

  @override
  Widget build(BuildContext context) {
    double bmi = berat / pow(tinggi / 100, 2);
    String cBMI;
    String msg;

    if (bmi >= 28) {
      cBMI = "You're Obese";
      msg = "Please keep your health in check";
    } else if (bmi >= 23) {
      cBMI = "You're Overweight";
      msg = "Do some exercise and eath healthy";
    } else if (bmi >= 17.5) {
      cBMI = "You're Normal";
      msg = "Congratulations, keep it up";
    } else {
      cBMI = "Underweight";
      msg = "Eat more to gain weight";
    }
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text('RESULT'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              cBMI,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            Text(
              msg,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            Text(
              'Normal BMI Range',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            Text(
              '17,5 -  22.9 ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        child: RaisedButton(
          color: Theme.of(context).accentColor,
          child: Text(
            'CALCULATE AGAIN',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
