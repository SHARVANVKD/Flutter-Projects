import 'package:ui_works/Widgets/profileRound.dart';
import 'package:ui_works/Widgets/textWidget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: <Widget>[
              //Container
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 600,
                  height: 300,
                  color: Colors.pink.shade300,
                ),
              ),
              ProfileRound1(), //Container
              Positioned(
                left: 100,
                top: 250,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 90,
                  width: 400,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      details(heading: 'POSTS', results: '5200'),
                      details(heading: 'FOLLOWERS', results: '25.3 K'),
                      details(heading: 'FOLLOW', results: '1322'),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 400,
                left: 100,
                child: TextWidget(
                    texts: 'bio : ',
                    fontWeight: (FontWeight.normal),
                    txtColor: (Colors.pink.shade300),
                    fontSize: 26),
              ),
              Positioned(
                top: 450,
                left: 100,
                // child: Text(
                //   bioInfo,
                //   style: TextStyle(
                //     fontSize: 21,
                //     color: Colors.black,
                //
                //   ),
                // ),
                child: TextWidget(
                    texts: bioInfo,
                    fontWeight: (FontWeight.normal),
                    txtColor: (Colors.black),
                    fontSize: 21),
              ),
              Positioned(
                top: 720,
                left: 100,
                child: SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: TextWidget(
                        texts: 'Contact-me',
                        fontWeight: (FontWeight.normal),
                        txtColor: (Colors.white70),
                        fontSize: 26),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Colors.red)),
                    ),
                  ),
                ),
              )

              //Container
            ], //<Widget>[]
          ),
        ),
      ),
    );
  }

  String bioInfo =
      'My name is Alice ,  and i am  a freelance \n mobile developper. \n '
      'If You need any mobile app for Your \n Company '
      'then Contact me for more \n informations ,'
      'and i am  a freelance \n mobile developper. ';
  Widget details({heading, results}) {
    return Column(
      children: [
        TextWidget(
            texts: heading,
            fontWeight: (FontWeight.bold),
            txtColor: (Colors.pink.shade300),
            fontSize: 21),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            results,
            style: TextStyle(color: Colors.pink.shade300, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
