import 'package:flutter/material.dart';

class CustomContainerWidget extends StatelessWidget {
  double? height;
  double? width;
  Widget? childWidget;
  Color? color;
  AlignmentGeometry? align;
  Decoration? decoration;
  CustomContainerWidget(
      {Key? key,
      this.color,
      this.childWidget,
      this.height,
      this.width,
      this.align,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
      height: height,
      width: width,
      color: color,
      child: childWidget,
      decoration: decoration,
    );
  }
}
