import 'package:flutter/cupertino.dart';

class CustomSizedBox_Widgets extends StatelessWidget {
  double heights;
  CustomSizedBox_Widgets({Key? key, required this.heights}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heights,
    );
  }
}
