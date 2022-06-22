import 'package:flutter/material.dart';

class AnimateDefaultTextStyle extends StatefulWidget {
  const AnimateDefaultTextStyle({Key? key}) : super(key: key);

  @override
  State<AnimateDefaultTextStyle> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<AnimateDefaultTextStyle> {
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
        child: AnimatedDefaultTextStyle(
          duration: const Duration(seconds: 3),
          child: const Text('Geojit Technologies'),
          style: selected
              ? const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)
              : const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
          curve: Curves.elasticOut,
        ),
      ),
    );
  }
}
