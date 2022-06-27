import 'package:flutter/material.dart';
import 'package:navigation_complete/UI/custome_widgets/custom_elevated_button.dart';
import 'package:navigation_complete/UI/custome_widgets/custom_sized_box.dart';
import 'package:navigation_complete/UI/model/datas.dart';
import 'package:navigation_complete/UI/second_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key, this.appBarHeading}) : super(key: key);
  String? appBarHeading;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(title: Text(appBarHeading ?? 'First Screen')),
        body: Column(children: [
          CustomSizedBoxes(
            height: 50,
          ),
          Text(
            'Navigator.push',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElavatedButton(
                onClick: () async {
                  final res = await Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage(),
                          settings: RouteSettings(
                              arguments: Datas(name: 'Hashil', age: 23))));
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text('$res')));
                },
                btnText: 'Push Replacement',
              ),
              CustomElavatedButton(
                onClick: () {
                  Navigator.pushReplacementNamed(context, 'secondPage',
                      arguments: Datas(name: 'Hashil', age: 23));
                },
                btnText: 'Push Replacement Named',
              ),
            ],
          ),
          CustomElavatedButton(
            onClick: () async {
              final result = await Navigator.pushNamed(context, 'secondPage',
                  arguments: Datas(name: 'Hashil', age: 23));
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('$result')));
            },
            btnText: 'Go to Next Page',
          ),
          Text(
            'Navigator.of(context)',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElavatedButton(
                onClick: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => SecondPage(),
                      settings: RouteSettings(
                          arguments: Datas(name: 'Hashil', age: 23))));
                },
                btnText: 'Push Replacement',
              ),
              CustomElavatedButton(
                onClick: () {
                  Navigator.of(context).pushReplacementNamed('secondPage',
                      arguments: Datas(name: 'Hashil', age: 23));
                  // Navigator.pushReplacementNamed(context, 'secondPage');
                },
                btnText: 'Push Replacement Named',
              ),
            ],
          ),
          CustomElavatedButton(
            onClick: () {
              Navigator.pushNamed(context, 'secondPage',
                  arguments: Datas(name: 'Hashil', age: 23));
            },
            btnText: 'Go to Next Page',
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
                  Navigator.pop(context, 'first page');
                },
                btnText: 'Pop',
              ),
              CustomElavatedButton(
                onClick: () {
                  Navigator.popAndPushNamed(context, 'secondPage',
                      arguments: Datas(name: 'Hashil', age: 23));
                },
                btnText: 'PopAndPushNamed',
              ),
            ],
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
                onClick: () async {
                  final result = await Navigator.pushNamed(
                      context, 'secondPage',
                      arguments: Datas(name: 'Hashil', age: 23));
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text('$result')));
                },
                btnText: 'Go to Next Page',
              ),
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
                Navigator.restorablePush(context, _myRouteBuilder,
                    arguments: Datas(name: 'Hashil', age: 23));
              },
              btnText: 'Restorable Push'),
        ]),
      ),
      onWillPop: () async {
        Navigator.pop(context, 'first page');
        return false;
      },
    );
  }

  final snackBar = SnackBar(
    content: const Text('This is Last Page'),
  );
  static Route<void> _myRouteBuilder(BuildContext context, Object? arguments) {
    return MaterialPageRoute<void>(
        builder: (BuildContext context) => SecondPage(),
        settings: RouteSettings(arguments: Datas(name: 'Hashil', age: 23)));
  }
}
