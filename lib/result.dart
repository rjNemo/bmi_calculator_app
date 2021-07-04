import 'package:flutter/material.dart';

class Results {
  int bodyMassIndex;
  int bodyFatPercentage;

  late Map results;

  Results(this.bodyMassIndex, this.bodyFatPercentage) {
    results = _results();
  }

  Map _results() {
    if (bodyMassIndex > 40) {
      return {
        "category": "Morbid obesity",
        "icon": "🤒",
        "color": Colors.red,
      };
    }
    if (bodyMassIndex > 30) {
      return {
        "category": "Obesity",
        "icon": "🤕",
        "color": Colors.orange,
      };
    }
    if (bodyMassIndex > 25) {
      return {
        "category": "Overweight",
        "icon": "🛑",
        "color": Colors.yellow,
      };
    }
    if (bodyMassIndex > 18) {
      return {
        "category": "Normal",
        "icon": "✓",
        "color": Colors.green,
      };
    }
    return {
      "category": "Too skinny",
      "icon": "🤔",
      "color": Colors.pink,
    };
  }
}

class ResultPage extends StatelessWidget {
  static const routeName = '/results';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Results;

    return Scaffold(
      appBar: AppBar(
        title: Text("Your results"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Your current BMI: ${args.bodyMassIndex}",
                style: TextStyle(fontSize: 28.0),
              ),
              Text(
                "Your current BFP: ${args.bodyFatPercentage}%",
                style: TextStyle(fontSize: 28.0),
              ),
              Text(
                args.results["icon"],
                style: TextStyle(fontSize: 40.0),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Your BMI is '),
                    TextSpan(
                      text: '${args.bodyMassIndex}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: args.results["color"],
                      ),
                    ),
                    TextSpan(text: ', and your BFP is '),
                    TextSpan(
                      text: '${args.bodyFatPercentage}%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: args.results["color"],
                      ),
                    ),
                    TextSpan(text: ', indicating your weight is in the '),
                    TextSpan(
                      text: '${args.results["category"]}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: args.results["color"],
                      ),
                    ),
                    TextSpan(text: ' range for adults of your height.'),
                  ],
                ),
              ),
              Text(
                "Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.",
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Recalculate BMI'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
