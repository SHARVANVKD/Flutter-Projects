import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Overflows extends StatelessWidget {
  const Overflows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100,
        height: 100,
        color: Colors.black38,
        child: SizedBox(
          width: 300,
          height: 50,
          child: RaisedButton(
            color: Color.fromARGB(100, 0, 128, 128),
            child: Text('Woolha', style: TextStyle(color: Colors.white)),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
