import 'dart:async';



import 'package:flutter/material.dart';
import './home.dart';
import 'assets.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: const Scaffold(
        backgroundColor: Colors.cyan,
        body: SplashScreen(),

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      Timer(
        const Duration(seconds: 4),
          () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()))
      );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: Image.asset(facebookIcon,width: 200,height: 200,),
          )
        ],
      ),
    );
  }
}


