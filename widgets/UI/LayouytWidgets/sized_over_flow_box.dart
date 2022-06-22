import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SizedOverFlowBox extends StatelessWidget {
  const SizedOverFlowBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: SizedOverflowBox(
          size: const Size(100, 100),
          child: Container(height: 50.0, width: 150.0, color: Colors.teal),
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
