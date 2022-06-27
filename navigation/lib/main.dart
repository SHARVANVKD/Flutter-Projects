import 'package:flutter/material.dart';
import 'package:navigation_complete/UI/first_page.dart';
import 'package:navigation_complete/UI/homeScreen.dart';
import 'package:navigation_complete/UI/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'HomePage',
      routes: {
        'HomePage': (context) => HomeScreen(),
        'firstPage': (context) => FirstPage(),
        'secondPage': (context) => SecondPage(),
      },
    );
  }
}
