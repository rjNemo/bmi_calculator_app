import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Text("Hey"),
    );
  }
}
