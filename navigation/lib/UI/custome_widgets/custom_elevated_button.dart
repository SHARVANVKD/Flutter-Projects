import 'package:flutter/material.dart';

class CustomElavatedButton extends StatelessWidget {
  CustomElavatedButton({Key? key, this.btnText, required this.onClick})
      : super(key: key);
  String? btnText;
  Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onClick, child: Text(btnText ?? 'Click'));
  }
}
