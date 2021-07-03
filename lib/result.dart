import 'package:flutter/material.dart';

class Results {
  int bodyMassIndex;
  int bodyFatPercentage;

  Results(this.bodyMassIndex, this.bodyFatPercentage);
}

class ResultPage extends StatelessWidget {
  static const routeName = '/results';

  @override
  Widget build(BuildContext context) {
    final results = ModalRoute.of(context)!.settings.arguments as Results;

    return Scaffold(
      appBar: AppBar(
        title: Text("Your results"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "Your results: BMI: ${results.bodyMassIndex};  BFP: ${results.bodyFatPercentage}"),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
        ],
      )),
    );
  }
}
