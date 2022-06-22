import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Offstages extends StatefulWidget {
  Offstages({Key? key}) : super(key: key);

  @override
  State<Offstages> createState() => _OffstagesState();
}

class _OffstagesState extends State<Offstages> {
  final GlobalKey _key = GlobalKey();

  bool _offstage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Offstage(
            offstage: _offstage,
            child: FlutterLogo(
              key: _key,
              size: 150.0,
            ),
          ),
          Text('Flutter logo is offstage: $_offstage'),
          ElevatedButton(
            child: const Text('Toggle Offstage Value'),
            onPressed: () {
              setState(() {
                _offstage = !_offstage;
              });
            },
          ),
        ],
      ),
    );
  }
}
