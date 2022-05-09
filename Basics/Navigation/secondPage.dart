import 'package:flutter/material.dart';

class SecondPageNavigation extends StatelessWidget {
  const SecondPageNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Text("Second Page..."),
              ElevatedButton(onPressed: () {

                //one method pop

                //Navigator.of(context).pop();

                //second method

                Navigator.of(context).pop('screen_1');
              }, child: Text('Go to Home'))
            ],
          ),
        ),
      ),
    );
  }
}

