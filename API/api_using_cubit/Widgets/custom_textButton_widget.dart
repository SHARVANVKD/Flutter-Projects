import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextButtonWidget extends StatelessWidget {
  CustomTextButtonWidget(
      {Key? key, required this.btnAction, required this.textBtn})
      : super(key: key);

  String textBtn;
  Function() btnAction;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(textBtn),
      onPressed: () {
        btnAction();
      },
    );
  }
}
