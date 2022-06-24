import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PersentIndicators extends StatefulWidget {
  const PersentIndicators({Key? key}) : super(key: key);

  @override
  State<PersentIndicators> createState() => _PersentIndicators();
}

class _PersentIndicators extends State<PersentIndicators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Persent Indicators')),
      body: CircularPercentIndicator(
        radius: 60.0,
        lineWidth: 5.0,
        percent: 1.0,
        center: new Text("100%"),
        progressColor: Colors.green,
      ),
    );
  }
}
