import 'package:flutter/material.dart';

class BoxConstraineds extends StatelessWidget {
  const BoxConstraineds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeeksforGeeks'),
        backgroundColor: Colors.greenAccent[400],
        centerTitle: true,
      ), //AppBar
      body: Center(
        /** ConstrainedBox Widget **/
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(height: 200, width: 200),
          child: Container(
            color: Colors.green,
          ), //Container widget
        ), //ConstrainedBox
      ), //Center
    );
  }
}
