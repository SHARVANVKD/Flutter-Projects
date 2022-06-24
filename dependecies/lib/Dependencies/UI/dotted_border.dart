import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedBorders extends StatelessWidget {
  const DottedBorders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DottedBorder(
        color: Colors.black,
        strokeWidth: 1,
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
