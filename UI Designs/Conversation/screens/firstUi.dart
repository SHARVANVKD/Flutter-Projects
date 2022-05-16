import 'package:flutter/material.dart';
import 'package:ui_works/assets.dart';

class FirstUi extends StatelessWidget {
  const FirstUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 50,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Conversations',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.red,
                      size: 20,
                    ),
                    label: Text(
                      'Add New',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.pink.shade50),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.red)))),
                  ),
                )
              ],
            ),
            body: Container(
              color: Colors.white,
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    height: 50,
                    color: Colors.white,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          labelText: 'Search...',
                          fillColor: Colors.white70),
                    ),
                  ),
                  Column(
                    children: [
                      ListTileClass(
                          ProfilePhoto: mummuka,
                          ProfileName: 'Kriss Benwat',
                          Message: 'Good to know',
                          Time: 'Today'),
                      ListTileClass(
                          ProfilePhoto: cycle,
                          ProfileName: 'Rezi Makarove',
                          Message: 'Its been while',
                          Time: 'Today'),
                      ListTileClass(
                          ProfilePhoto: aarya,
                          ProfileName: 'Gustav Lemolo',
                          Message: 'Hey , Where are you ? ',
                          Time: 'Yesterday'),
                      ListTileClass(
                          ProfilePhoto: anu,
                          ProfileName: 'Bob Ryder',
                          Message: 'its over!',
                          Time: '28 jan'),
                      ListTileClass(
                          ProfilePhoto: kgf,
                          ProfileName: 'Keen Simada',
                          Message: 'Your welcome',
                          Time: '24 jan'),
                      ListTileClass(
                          ProfilePhoto: mummuka,
                          ProfileName: 'Emma Waiking',
                          Message: 'I am going out ...',
                          Time: '13 jan'),
                      ListTileClass(
                          ProfilePhoto: prithi,
                          ProfileName: 'Gilbert Hammingway',
                          Message: 'Just attach the image and send it',
                          Time: '12 jan'),
                      ListTileClass(
                          ProfilePhoto: aarya,
                          ProfileName: 'Bella Hamers',
                          Message: 'The LLL is says',
                          Time: '5 jan'),
                    ],
                  )
                ],
              ),
            ),

            // bottomNavigationBar: BottomNavigationBar(
            //   backgroundColor: Colors.black,
            //   iconSize: 10,

            //
            // ),
            //
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Fixed
              backgroundColor: Colors.white, // <-- This works for fixed
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              items: <BottomNavigationBarItem>[
                navIcons(
                    labelText: 'Chats', icons: Icons.chat, color: Colors.red),
                navIcons(
                    labelText: 'Channels',
                    icons: Icons.supervised_user_circle_rounded,
                    color: Colors.grey),
                navIcons(
                    labelText: 'Profile',
                    icons: Icons.portrait_rounded,
                    color: Colors.grey),
              ],
            )));
  }

  BottomNavigationBarItem navIcons({icons, labelText, color}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icons,
        color: color,
        size: 20,
      ),
      label: labelText,
    );
  }
}

class ListTileClass extends StatelessWidget {
  final String ProfilePhoto, ProfileName, Message, Time;

  ListTileClass(
      {Key? key,
      required this.ProfilePhoto,
      required this.ProfileName,
      required this.Message,
      required this.Time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(ProfilePhoto),
      ),
      title: Text(ProfileName),
      subtitle: Text(Message),
      trailing: Text(Time),
    );
  }
}

// Container(
// padding: EdgeInsets.only(
// left: 30,
// right: 30,
// ),
// height: 40,
// color: Colors.white,
// child: TextField(
// decoration: InputDecoration(
// prefixIcon: Icon(
// Icons.search,
// color: Colors.black12,
// ),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(30.0),
// borderSide: BorderSide(
// color: Colors.white,
// ),
// ),
// filled: true,
// labelText: 'Search...',
// labelStyle: TextStyle(color: Colors.black12),
// fillColor: Colors.black12),
// ),
// ),
