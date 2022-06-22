import 'package:flutter/material.dart';

class IntrinsicHeights extends StatelessWidget {
  const IntrinsicHeights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 150,
              height: 100,
              color: Colors.teal,
            ),
            Container(
              width: 150,
              height: 200,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
