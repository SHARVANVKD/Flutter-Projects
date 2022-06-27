import 'package:flutter/material.dart';
import 'package:navigation_complete/UI/custome_widgets/custom_elevated_button.dart';
import 'package:navigation_complete/UI/custome_widgets/custom_sized_box.dart';
import 'package:navigation_complete/UI/first_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home Page')),
        body: Column(children: [
          CustomSizedBoxes(
            height: 30,
          ),
          Text(
            'Navigator.push',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElavatedButton(
                    onClick: () async {
                      await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage(
                                        appBarHeading: 'First Page',
                                      )))
                          .then((value) => ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(content: Text(value))));
                    },
                    btnText: 'Push'),
                CustomSizedBoxes(width: 10),
                CustomElavatedButton(
                    onClick: () {
                      Navigator.pushNamed(context, 'firstPage');
                    },
                    btnText: 'Push Named'),
                CustomElavatedButton(
                    onClick: () {
                      Navigator.pushNamed(context, 'firstPage');
                    },
                    btnText: 'Go To'),
              ],
            ),
          ),
          Text(
            'Navigator.of(context)',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElavatedButton(
                    onClick: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    btnText: 'Push'),
                CustomSizedBoxes(width: 10),
                CustomElavatedButton(
                    onClick: () {
                      Navigator.of(context).pushNamed('firstPage');
                    },
                    btnText: 'Push Named'),
                CustomElavatedButton(
                    onClick: () {
                      Navigator.pushNamed(context, 'firstPage');
                    },
                    btnText: 'Go To'),
              ],
            ),
          ),
          CustomSizedBoxes(
            height: 50,
          ),
          Text(
            'Navigator.pop',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElavatedButton(
                onClick: () {
                  Navigator.maybePop(context);
                },
                btnText: 'MayBePop',
              ),
              CustomElavatedButton(
                onClick: () {
                  bool res = Navigator.canPop(context);
                  (res == true)
                      ? showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Exitc the page'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'OK');
                                  Navigator.maybePop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        )
                      : ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                btnText: 'CanPop',
              ),
              CustomElavatedButton(
                  onClick: () {
                    Navigator.pushNamed(context, 'firstPage');
                  },
                  btnText: 'Go To'),
            ],
          ),
          CustomSizedBoxes(
            height: 50,
          ),
          Text(
            'Restorable Push',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          CustomElavatedButton(
              onClick: () {
                Navigator.restorablePush(context, _myRouteBuilder);
              },
              btnText: 'Restorable Push'),
        ]));
  }

  final snackBar = SnackBar(
    content: const Text('This is Last Page'),
  );
  static Route<void> _myRouteBuilder(BuildContext context, Object? arguments) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => FirstPage(),
    );
  }
}
