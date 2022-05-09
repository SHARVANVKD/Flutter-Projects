import 'package:basics/Navigation/secondPage.dart';
import 'package:flutter/material.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Text("Home Page..."),
              ElevatedButton(onPressed: () {



                // push One method

                /* -------------------------------


                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return SecondPageNavigation();
                }));

                ------------------------------------ */



                // second method

                // first we declare route :{ ...................} All page name in Main page ->home()

                Navigator.of(context).pushNamed('screen_2');

              }, child: Text('Go to Second Page'))
            ],
          ),
        ),
      ),
    );
  }
}

