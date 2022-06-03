import 'package:flutter/material.dart';

class CustomIconWidget extends StatelessWidget {
  IconData icon;
  double? iconSize;
  Color? iconColor;
  CustomIconWidget(
      {Key? key, this.iconColor, this.iconSize, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: iconSize,
      color: iconColor,
    );
  }
}
