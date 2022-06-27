import 'package:flutter/material.dart';

class CustomSizedBoxes extends StatelessWidget {
  CustomSizedBoxes({Key? key, this.width, this.height, this.child})
      : super(key: key);
  double? width;
  double? height;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
