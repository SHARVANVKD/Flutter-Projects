import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {Key? key, required this.onpressed, this.labelText, required this.icon})
      : super(key: key);
  Function() onpressed;
  String? labelText;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onpressed,
      label: Text(labelText ?? ''),
      icon: Icon(
        icon,
        size: 17,
      ),
    );
  }
}
