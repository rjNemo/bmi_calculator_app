import 'package:bmi_calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "/profile";

  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, String>> storedMeasurements = [];

  Future<void> _getResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var measurements = prefs.getKeys().map((key) {
      List<String>? tmp = prefs.getStringList(key);
      return {"date": key, "bmi": tmp![0], "bfp": tmp[1]};
    }).toList();

    setState(() {
      storedMeasurements = measurements;
    });
  }

  @override
  void initState() {
    _getResults();
    super.initState();
  }

  Future<void> clearMeasurements() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your profile"),
      ),
      body: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: storedMeasurements.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: ListTile(
                  onTap: null,
                  leading: CircleAvatar(
                    backgroundColor: Colors.lightGreen,
                    child: Text("${index + 1}"),
                    foregroundColor: Colors.white,
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(child: Text(storedMeasurements[index]["date"]!)),
                      Expanded(child: Text(storedMeasurements[index]["bmi"]!)),
                      Expanded(child: Text(storedMeasurements[index]["bfp"]!)),
                    ],
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                clearMeasurements();
                Navigator.pushNamed(context, CalculatorPage.routeName);
              },
              child: Text("Clear Measurements"))
        ],
      ),
    );
  }
}
