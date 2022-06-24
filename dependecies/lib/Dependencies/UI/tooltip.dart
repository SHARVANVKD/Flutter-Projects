import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class Tooltips extends StatelessWidget {
  const Tooltips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expandable')),
      body: Center(
        child: JustTheTooltip(
          child: Material(
            color: Colors.grey.shade800,
            shape: const CircleBorder(),
            elevation: 4.0,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          content: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: Text(
                'Bacon ipsum dolor amet kevin turducken brisket pastrami, salami ribeye spare ribs tri-tip sirloin shoulder venison shank burgdoggen chicken pork belly. Short loin filet mignon shoulder rump beef ribs meatball kevin.',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
