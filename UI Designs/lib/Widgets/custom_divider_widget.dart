import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDividerWidget extends StatelessWidget {
  double? thickness;
  Color? color;
  CustomDividerWidget({Key? key, this.thickness, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
    );
  }
}
