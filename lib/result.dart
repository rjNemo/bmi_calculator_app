import 'package:flutter/material.dart';

class Results {
  int bodyMassIndex;
  int bodyFatPercentage;

  Results(this.bodyMassIndex, this.bodyFatPercentage);

  String category() {
    if (bodyMassIndex > 12) {
      return "Normal";
    }
    return "Too much";
  }

  Icon icon() => Icon(Icons.female);
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          results.icon(), //
          Text("Below are your results given your height, age and gender."),
          Text(
            "Your BMI is ${results.bodyMassIndex}, and your BFP is ${results.bodyFatPercentage}, indicating your weight is in the ${results.category()} for adults of your height.",
          ),
          Text(
            "Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.",
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Recalculate BMI'),
          ),
        ],
      )),
    );
  }
}
