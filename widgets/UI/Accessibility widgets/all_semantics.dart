import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SemanticsExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SemanticsExampleState();
  }
}

class _SemanticsExampleState extends State<SemanticsExample> {
  bool _showCard = false;
  static const TextStyle textStyle = const TextStyle(color: Colors.white);

//showSemanticsDebugger : true /false set aakiyal in main menthod il koduthal kanam , only for developper

  Widget _buildCard() {
    return Card(
      color: Colors.teal,
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: const FlutterLogo(),
              title: ExcludeSemantics(
                  excluding: true,
                  child: Text('Flutter Tutorial', style: textStyle)),
              subtitle: Text('by Woolha', style: textStyle),
            ),
            ButtonTheme(
              child: ButtonBar(
                children: <Widget>[
                  TextButton(
                    child: const Text('OK', style: textStyle),
                    onPressed: () => setState(() {
                      _showCard = false;
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ExcludeSemantics(
            child: const Text('........'),
          ),
          SizedBox(
            width: 400,
            height: 160,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 0,
                  child: OutlinedButton(
                    child: Semantics(
                        label: 'It is a Text Feild To show Warning',
                        child: Text('Show Card')),
                    onPressed: () => setState(() {
                      _showCard = true;
                    }),
                  ),
                ),
                BlockSemantics(
                  blocking: _showCard,
                  child: Visibility(
                    visible: _showCard,
                    child: _buildCard(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
