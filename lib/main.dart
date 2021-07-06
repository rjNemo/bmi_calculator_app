import 'package:flutter/material.dart';

import 'calculator.dart';
import 'profile.dart';
import 'result.dart';

void main() => runApp(BMIApp());

class BMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'BMI/BFP Calculator',
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        routes: {
          CalculatorPage.routeName: (context) => CalculatorPage(),
          ResultPage.routeName: (context) => ResultPage(),
          ProfilePage.routeName: (context) => ProfilePage(),
        },
      );
}
