import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String outputScreen = "0";

  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(outputScreen);
      operand = buttonText;

      _output = "0";
    } else if (buttonText == "=") {
      num2 = double.parse(outputScreen);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      outputScreen = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, flex) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(5),
        child: OutlineButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(24.0),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                outputScreen,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(children: [
              Row(children: [
                buildButton("7", 1),
                buildButton("8", 1),
                buildButton("9", 1),
                buildButton("/", 1)
              ]),
              Row(children: [
                buildButton("4", 1),
                buildButton("5", 1),
                buildButton("6", 1),
                buildButton("X", 1)
              ]),
              Row(children: [
                buildButton("1", 1),
                buildButton("2", 1),
                buildButton("3", 1),
                buildButton("-", 1)
              ]),
              Row(children: [buildButton("0", 3), buildButton("+", 1)]),
              Row(children: [
                buildButton("CLEAR", 1),
                buildButton("=", 1),
              ])
            ])
          ],
        ),
      ),
    );
  }
}
