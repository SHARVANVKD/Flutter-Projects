import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FractionallySizedBoxes extends StatelessWidget {
  const FractionallySizedBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 0.5,
          alignment: FractionalOffset.center,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              border: Border.all(
                color: Color.fromARGB(255, 56, 57, 58),
                width: 4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
