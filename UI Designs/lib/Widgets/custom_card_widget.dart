import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fund_allocations/Widgets/custom_container_widget.dart';
import 'package:fund_allocations/Widgets/custom_icon_widget.dart';
import 'package:fund_allocations/Widgets/custom_text_widget.dart';

class CustomCardWidget extends StatelessWidget {
  Widget? childWidget;
  ShapeBorder? shapeBorder;
  double? elevation;

  CustomCardWidget(
      {Key? key, this.childWidget, this.shapeBorder, this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: childWidget,
      shape: shapeBorder,
      elevation: elevation,
    );
  }
}
