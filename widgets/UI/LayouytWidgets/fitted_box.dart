import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FittedBoxes extends StatelessWidget {
  const FittedBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 400,
          width: 300,
          color: Colors.red,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Container(
              color: Colors.amber,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
