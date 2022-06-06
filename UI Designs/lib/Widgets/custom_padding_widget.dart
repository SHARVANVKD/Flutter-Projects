import 'package:flutter/cupertino.dart';

class CustomPaddingWidget extends StatelessWidget {
  double? left, right, top, bottom;
  Widget? childWidget;
  CustomPaddingWidget(
      {Key? key,
      this.bottom,
      this.left,
      this.right,
      this.top,
      this.childWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: left!, right: right!, top: top!, bottom: bottom!),
      child: childWidget,
    );
  }
}
