import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Notes';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  List<dynamic> notes = ['1,2,', 1212, 2323, 4545, '34sdfsf,'];
  final Map<String, int> score = {'playe1': 1, 'player2': 2};
  MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        //normal ListView

        // child: ListView(
        //     children: List.generate(100, (index) {
        //   return Text('text $index');
        // })),


        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.lightGreen,
                //network Image Link
                backgroundImage: NetworkImage(
                    'data:image/jpeg;base64,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'),
              ),
              title: Text('sharvan $index'),
              subtitle: Text('this is personal message $index'),
              trailing: Text('$index:00 PM'),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: 30,
        ),
      ),
    );
  }
}
