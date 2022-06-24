import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Expandable extends StatelessWidget {
  const Expandable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expandable')),
      body: ExpandablePanel(
        header: Text('Heading'),
        collapsed: Text(
          'asdasdasdasdasdsad',
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        expanded: Text(
          'asdasdasdsadsadsadsadsd',
          softWrap: true,
        ),
      ),
    );
  }
}
