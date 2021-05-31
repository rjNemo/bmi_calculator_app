import 'package:flutter/material.dart';

import 'calculator.dart';

void main() => runApp(BMIApp());

class BMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'BMI/BFP Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CalculatorPage(),
    );
}


