import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/loginPage.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login App",
    theme: ThemeData(
      primaryColor: Colors.green
    ),
    home: LoginPage(),
  ));
}