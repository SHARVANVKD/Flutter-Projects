import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationBuilders extends StatefulWidget {
  const AnimationBuilders({Key? key}) : super(key: key);

  @override
  State<AnimationBuilders> createState() => _AnimationBuildersState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _AnimationBuildersState extends State<AnimationBuilders>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
        child: const Center(
          child: Text('Whee!'),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          //offset: const Offset(0.0, 15.0),
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}
