import 'package:flutter/material.dart';

class TransformClass extends StatefulWidget {
  TransformClass({Key? key}) : super(key: key);

  @override
  State<TransformClass> createState() => _TransformClass();
}

class _TransformClass extends State<TransformClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3)..rotateZ(-05 / 12.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: const Text('Apartment for rent!'),
            ),
          ),
        ),
      ),
    );
  }
}
