import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? textColor;
  CustomTextWidget(
      {Key? key,
      required this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
