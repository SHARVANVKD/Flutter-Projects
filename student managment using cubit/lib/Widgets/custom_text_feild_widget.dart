import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextWidgets extends StatelessWidget {
  String text_;
  Color? textColor;
  double? fontSize;
  CustomTextWidgets(
      {Key? key, required this.text_, this.textColor, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text_,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
