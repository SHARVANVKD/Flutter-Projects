import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: Container(
          color: Colors.greenAccent,
          child: Text('Home Scree'),
        ),
      ),
    );
  }
}
