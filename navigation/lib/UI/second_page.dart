import 'package:flutter/material.dart';
import 'package:navigation_complete/UI/custome_widgets/custom_elevated_button.dart';
import 'package:navigation_complete/UI/custome_widgets/custom_sized_box.dart';
import 'package:navigation_complete/UI/homeScreen.dart';
import 'package:navigation_complete/UI/model/datas.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Datas;
    return Scaffold(
        appBar: AppBar(title: Text(args.name.toString()), actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(args.age.toString()),
          )
        ]),
        body: Center(
          child: Column(children: [
            CustomSizedBoxes(
              height: 50,
            ),
            Text(
              'Navigator.push',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            CustomElavatedButton(
              onClick: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false);
              },
              btnText: 'PushAndRemoveUntil',
            ),
            CustomElavatedButton(
              onClick: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'HomePage', (route) => false);
              },
              btnText: 'PushNamedAndRemoveUntil',
            ),
            Text(
              'Navigator.of(context)',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            CustomElavatedButton(
              onClick: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false);
              },
              btnText: 'PushAndRemoveUntil',
            ),
            CustomElavatedButton(
              onClick: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('HomePage', (route) => false);
              },
              btnText: 'PushNamedAndRemoveUntil',
            ),
            CustomSizedBoxes(
              height: 50,
            ),
            Text(
              'Navigator.pop',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            CustomElavatedButton(
              onClick: () {
                Navigator.pop(context, 'second page');
              },
              btnText: 'Pop',
            ),
            CustomElavatedButton(
              onClick: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('HomePage'),
                );
              },
              btnText: 'PopUntil',
            ),
          ]),
        ));
  }
}
