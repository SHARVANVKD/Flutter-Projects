import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomListTileWidget extends StatelessWidget {
  CustomListTileWidget(
      {Key? key, this.leading, this.subTitle, this.title, this.trailing})
      : super(key: key);
  Widget? leading, title, subTitle, trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subTitle,
      trailing: trailing,
    );
  }
}
