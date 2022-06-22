import 'package:flutter/material.dart';

class ElevatedBtn extends StatefulWidget {
  const ElevatedBtn({Key? key}) : super(key: key);

  @override
  State<ElevatedBtn> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ElevatedBtn> {
  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style =
    //     ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              //style: style,
              onPressed: null,
              child: const Text('srd'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              //style: style,
              onPressed: () {},
              child: const Text('Enaasdbled'),
            ),
          ],
        ),
      ),
    );
  }
}
