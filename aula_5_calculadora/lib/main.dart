import 'package:flutter/material.dart';

void main() {
  runApp(Calculadora());
}

class Calculadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aula 5 - Calculadora'),
        ),
        body: CalculadoraHome(),
      ),
    );
  }
}

class CalculadoraHome extends StatefulWidget {
  @override
  _CalculadoraHomeState createState() => _CalculadoraHomeState();
}

class _CalculadoraHomeState extends State<CalculadoraHome> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "LIMPAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Ele já possuí um decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

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

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
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
          padding: EdgeInsets.all(24.0),
          side: BorderSide(width: 2, color: Colors.blue),
        ),
        child: Text(buttonText,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Text(output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold))),
      Expanded(
        child: Divider(),
      ),
      Column(children: [
        Row(children: [
          buildButton("7"),
          buildButton("8"),
          buildButton("9"),
          buildButton("/")
        ]),
        Row(children: [
          buildButton("4"),
          buildButton("5"),
          buildButton("6"),
          buildButton("X")
        ]),
        Row(children: [
          buildButton("1"),
          buildButton("2"),
          buildButton("3"),
          buildButton("-")
        ]),
        Row(children: [
          buildButton("."),
          buildButton("0"),
          buildButton("00"),
          buildButton("+")
        ]),
        Row(children: [
          buildButton("LIMPAR"),
          buildButton("="),
        ])
      ])
    ]));
  }
}
