import 'package:basics/Navigation/homeNavigation.dart';
import 'package:basics/Navigation/secondPage.dart';
import 'package:basics/watsapChatArea/watsapChatHome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaceBook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WatsAppChatHome(),
      routes: {
        'screen_1': (ctx) => HomeNavigation(),
        'screen_2': (ctx) => SecondPageNavigation(),
      },
    );
  }
}
