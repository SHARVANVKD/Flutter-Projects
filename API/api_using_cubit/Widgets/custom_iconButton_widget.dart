import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomIconButtonWidget extends StatelessWidget {
  CustomIconButtonWidget(
      {Key? key, required this.icon, required this.iconAction})
      : super(key: key);
  Function() iconAction;
  Icon icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: iconAction, icon: icon);
  }
}
