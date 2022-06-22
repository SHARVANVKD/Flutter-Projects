import 'package:flutter/material.dart';

class AnimationAlign extends StatefulWidget {
  const AnimationAlign({Key? key}) : super(key: key);

  @override
  State<AnimationAlign> createState() => _AnimationAlignState();
}

class _AnimationAlignState extends State<AnimationAlign> {
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
        child: Container(
          width: 250.0,
          height: 250.0,
          color: Colors.red,
          child: AnimatedAlign(
            alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInExpo,
            child: const FlutterLogo(size: 50.0),
          ),
        ),
      ),
    );
  }
}
