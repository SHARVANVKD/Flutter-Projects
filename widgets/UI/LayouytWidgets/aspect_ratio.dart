import 'package:flutter/material.dart';

class AspectRatios extends StatelessWidget {
  const AspectRatios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        width: double.infinity,
        height: 100.0,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
