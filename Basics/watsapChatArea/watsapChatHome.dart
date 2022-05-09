import 'package:basics/Navigation/secondPage.dart';
import 'package:basics/watsapChatArea/persanalChatPage.dart';
import 'package:flutter/material.dart';

class WatsAppChatHome extends StatelessWidget {
  const WatsAppChatHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text(
                'Watsapp',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
            body: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                    ),
                    title: Text('sharvan $index'),
                    subtitle: Text('subTitle'),
                    trailing: Text('$index:00'),
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                          return PersonalChatHome(name: 'sharvan $index');
                        })
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: 50)),
      ),
    );
  }
}
