import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({Key? key, required this.onpressed, this.child})
      : super(key: key);
  Function() onpressed;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpressed, child: child);
  }
}
