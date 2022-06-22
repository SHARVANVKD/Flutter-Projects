import 'package:flutter/material.dart';

class PlaceHolders extends StatefulWidget {
  const PlaceHolders({Key? key}) : super(key: key);

  @override
  State<PlaceHolders> createState() => _PlaceHoldersState();
}

class _PlaceHoldersState extends State<PlaceHolders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              width: 200,
              child: Placeholder(
                color: const Color(0xFF455A64),
                fallbackHeight: 100,
                fallbackWidth: 100,
              )),
          Expanded(
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Placeholder(),
                ),
                Flexible(
                  flex: 1,
                  child: Placeholder(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
