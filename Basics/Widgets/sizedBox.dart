import 'package:flutter/material.dart';

class SizedBoxes extends StatelessWidget {
  const SizedBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Column(
          children: [
            TextField(

            ),
            SizedBox(

            ),
            Container(
              color: Colors.greenAccent,
              width: 200,
              height: 200,
            ),
          ],
        )),
      ),
    );
  }
}
