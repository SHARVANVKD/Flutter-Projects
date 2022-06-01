import 'package:flutter/material.dart';

class CustomeElavatedButtonWidgets extends StatelessWidget {
  String texts;
  Color? btnBackgroundColor;
  double? borderRadius;
  double? paddings;
  Function onpressed;
  CustomeElavatedButtonWidgets(
      {Key? key,
      required this.texts,
      required this.onpressed,
      this.btnBackgroundColor,
      this.paddings,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onpressed();
        },
        child: Text(texts),
        style: ElevatedButton.styleFrom(
            primary: btnBackgroundColor,
            padding: EdgeInsets.symmetric(horizontal: paddings ?? 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10))));
  }
}
