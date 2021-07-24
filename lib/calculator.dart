import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile.dart';
import 'result.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key}) : super(key: key);
  final String title = 'BMI Calculator';
  static const routeName = '/';

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double _weight = 60;
  double _height = 165;
  double _age = 18;
  int _gender = 0; // male = 1; female = 0

  @override
  void initState() {
    super.initState();
  }

  int bodyMassIndex() => ((_weight / (_height * _height)) * 10000).round();

  int bodyFatPercentage() =>
      (1.2 * bodyMassIndex() + .23 * _age - 10.8 * _gender - 5.4).round();

  Future<void> _saveResults() async {
    var now = DateTime.now().toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      now,
      [bodyMassIndex().toString(), bodyFatPercentage().toString()],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool _isWoman = _gender == 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            tooltip: 'Open profile page',
            onPressed: () {
              Navigator.pushNamed(context, ProfilePage.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: _isWoman ? Colors.lightGreen : null,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.female),
                      tooltip: 'Choose female gender',
                      onPressed: () {
                        setState(() => _gender = 0);
                      },
                      color: _isWoman ? Colors.white : Colors.lightGreen,
                    ),
                  ),
                ),
                Expanded(
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: !_isWoman ? Colors.lightGreen : null,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.male),
                      tooltip: 'Choose male gender',
                      onPressed: () {
                        setState(() => _gender = 1);
                      },
                      color: !_isWoman ? Colors.white : Colors.lightGreen,
                    ),
                  ),
                ),
              ],
            ),
            Text('Weight'),
            Text("${_weight.round().toString()} kg"),
            Slider(
              value: _weight,
              min: 0,
              max: 100,
              divisions: 100,
              label: _weight.round().toString(),
              onChanged: (double value) => setState(() => _weight = value),
            ),
            Text('Height'),
            Text("${_height.round().toString()} cm"),
            Slider(
              value: _height,
              min: 100,
              max: 200,
              divisions: 100,
              label: _height.round().toString(),
              onChanged: (double value) => setState(() => _height = value),
            ),
            Text('Age'),
            Text("${_age.round().toString()} years old"),
            Slider(
              value: _age,
              min: 10,
              max: 100,
              divisions: 100,
              label: _age.round().toString(),
              onChanged: (double value) => setState(() => _age = value),
            ),
            ElevatedButton(
              onPressed: () {
                _saveResults();

                Navigator.pushNamed(
                  context,
                  ResultPage.routeName,
                  arguments: Results(bodyMassIndex(), bodyFatPercentage()),
                );
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
