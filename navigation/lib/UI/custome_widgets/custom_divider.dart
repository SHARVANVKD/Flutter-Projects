import 'package:flutter/material.dart';

class CustomDivideres extends StatelessWidget {
  CustomDivideres({Key? key, this.width}) : super(key: key);
  double? width;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: width,
    );
  }
}
