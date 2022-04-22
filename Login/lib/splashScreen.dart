import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login/home.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>  Home()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          color: Colors.white,
          child:Image.asset("assets/loginIcon.png"),
      ),
    );
  }
}