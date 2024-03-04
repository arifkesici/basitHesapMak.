import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  double? result;

  void calculate(String operation) {
    final double number1 = double.parse(controller1.text);
    final double number2 = double.parse(controller2.text);
    switch (operation) {
      case '+':
        setState(() {
          result = number1 + number2;
        });
        break;
      case '-':
        setState(() {
          result = number1 - number2;
        });
        break;
      case 'x':
        setState(() {
          result = number1 * number2;
        });
        break;
      case '/':
        setState(() {
          result = number1 / number2;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hesap Makinesi')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: controller1,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(hintText: 'Birinci Sayı'),
          ),
          TextField(
            controller: controller2,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(hintText: 'İkinci Sayı'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => calculate('+'),
                child: Text('+'),
              ),
              ElevatedButton(
                onPressed: () => calculate('-'),
                child: Text('-'),
              ),
              ElevatedButton(
                onPressed: () => calculate('x'),
                child: Text('x'),
              ),
              ElevatedButton(
                onPressed: () => calculate('/'),
                child: Text('/'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => setState(() {}),
            child: Text('='),
          ),
          Text(
            'Sonuç: ${result ?? ''}',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
