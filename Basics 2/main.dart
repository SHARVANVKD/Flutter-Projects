import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              TextField(
                decoration:InputDecoration(
                 // border
                ),
              ),
              TextField(),

            ],
          ),
        ),
      ),
    );
  }
}
