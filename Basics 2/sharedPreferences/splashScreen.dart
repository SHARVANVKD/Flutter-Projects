

import 'package:basics2/sharedPreferences/homeScreen.dart';
import 'package:basics2/sharedPreferences/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//const SAVE_KEY_NAME = 'UserLogedIn';
void main() {
  runApp(MaterialApp(
    home: SplashScreens(),
  ));
}
class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _navigateUser();
    // Timer(const Duration(seconds: 5), () {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) =>  const HomeScreen()));
    // });
  }
  void _navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if(isLoggedIn == false ){
      Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }else{
          Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
  // Future <void> gotoLogin()async {
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
  //}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: Container(
          color: Colors.greenAccent,
          child: Text('Splash Scree'),
        ),
      ),
    );
  }
  // Future <void> checkUserLoggedIn() async{
  //   final _sharedPreferenc = await SharedPreferences.getInstance();
  //   final userLoggedIN =  _sharedPreferenc.getBool(SAVE_KEY_NAME);
  //   if(userLoggedIN == null || userLoggedIN == false){
  //     gotoLogin();
  //   }else{
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //   }
  //
  // }
}

