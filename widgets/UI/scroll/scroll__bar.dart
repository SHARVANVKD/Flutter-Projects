import 'package:flutter/material.dart';

class ScrollBars extends StatefulWidget {
  const ScrollBars({Key? key}) : super(key: key);

  @override
  State<ScrollBars> createState() => _ScrollBarsState();
}

class _ScrollBarsState extends State<ScrollBars> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            SizedBox(
                width: constraints.maxWidth / 2,
                // Only one scroll position can be attached to the
                // PrimaryScrollController if using Scrollbars. Providing a
                // unique scroll controller to this scroll view prevents it
                // from attaching to the PrimaryScrollController.
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _firstController,
                  child: ListView.builder(
                      controller: _firstController,
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Scrollable 1 : Index $index'),
                        );
                      }),
                )),
            SizedBox(
                width: constraints.maxWidth / 2,
                // This vertical scroll view has not been provided a
                // ScrollController, so it is using the
                // PrimaryScrollController.
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 50,
                            color: index.isEven
                                ? Colors.amberAccent
                                : Colors.blueAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Scrollable 2 : Index $index'),
                            ));
                      }),
                )),
          ],
        );
      }),
    );
  }
}
