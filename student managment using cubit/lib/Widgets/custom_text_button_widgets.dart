import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomeTextButtonWidgets extends StatelessWidget {
  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? textColor;
  Function onpressed;
  CustomeTextButtonWidgets(
      {Key? key,
      required this.text,
      required this.onpressed,
      this.fontSize,
      this.fontWeight,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onpressed();
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight, color: textColor),
        ));
  }
}
