import 'package:flutter/material.dart';
class TextWidget extends StatelessWidget {
  String texts;
  FontWeight fontWeight;
  Color txtColor;
  double fontSize;
   TextWidget({Key? key,required this.texts , required this.fontWeight, required this.txtColor,required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      texts,
      style: TextStyle(
          fontSize: fontSize,
          color: txtColor,
          fontWeight: fontWeight),
    );;
  }
}
