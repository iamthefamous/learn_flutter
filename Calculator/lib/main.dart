import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  _CalculatorHomePageState createState() {
    return _CalculatorHomePageState();
  }
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  buttonPressed(String buttonType) {
    if (buttonType == "CLEAR") {
      _output = "0";
      output = "0";
      num1 = 0;
      num2 = 0;
      operator = "";
    } else if (buttonType == "+" || buttonType == "-" || buttonType == "*" || buttonType == "*") {
      num1 = double.parse(output);
      operator = buttonType;
      _output = "0";
    } else if (buttonType == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonType;
      }
    } else if (buttonType == "=") {
      num2 = double.parse(output);

      if (operator == "+") {
        _output = (num1 + num2).toString();
      } else if (operator == "-") {
        _output = (num1 - num2).toString();
      } else if (operator == "/") {
        _output = (num1 / num2).toString();
      } else if (operator == "*") {
        _output = (num1 * num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operator = "";
    } else {
      _output = _output + buttonType;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });

  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(24.0),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              output,
              style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*"),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}