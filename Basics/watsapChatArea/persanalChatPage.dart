import 'package:flutter/material.dart';

class PersonalChatHome extends StatelessWidget {
  final String name;
  const PersonalChatHome({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(name),
          ),
          body: Column(
            children: [
              Text(name),
              ElevatedButton(onPressed: () {

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

