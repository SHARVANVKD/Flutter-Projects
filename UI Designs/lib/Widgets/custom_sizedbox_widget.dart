import 'package:flutter/material.dart';

class CustomSizedBoxWidget extends StatelessWidget {
  double? width;
  double? height;
  Widget? widget;
  CustomSizedBoxWidget({Key? key, this.widget, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: widget,
    );
  }
}
