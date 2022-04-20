import 'package:facebook/section/chatRoom.dart';
import 'package:facebook/section/headerButtonSection.dart';
import 'package:facebook/section/statusSection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:facebook/Widgets/appBarIcon.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget verticalDivider =  const Divider(
      thickness: 1,
      color: Color(0xFFE0E0E0),
    );
    Widget dividers = const Divider(
      thickness: 1,
      color: Color(0xFFE0E0E0),
    );


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "facebook",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            AppBarIcon(
                btnIcon: Icons.search,
                btnAction: () {
                  if (kDebugMode) {
                    print("search button clicked");
                  }
                }),
            AppBarIcon(
                btnIcon: Icons.messenger,
                btnAction: () {
                  if (kDebugMode) {
                    print("messenger button clicked");
                  }
                })
          ],
        ),
        body: ListView(
          children:  [
            const StatusSection(),
            verticalDivider,
            const HeaderButtonSection(),
            dividers,
            const ChatRoom(),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
