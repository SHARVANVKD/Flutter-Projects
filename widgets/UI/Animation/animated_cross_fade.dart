import 'package:flutter/material.dart';

class AnimatedCrossFades extends StatefulWidget {
  const AnimatedCrossFades({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFades> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<AnimatedCrossFades> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedCrossFade(
          duration: const Duration(seconds: 3),
          firstChild: const FlutterLogo(
              style: FlutterLogoStyle.horizontal, size: 100.0),
          secondChild:
              const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
          crossFadeState:
              selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}
