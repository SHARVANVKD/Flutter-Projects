import 'package:flutter/material.dart';
import 'package:fund_allocations/Widgets/custom_container_widget.dart';
import 'package:fund_allocations/Widgets/custom_icon_widget.dart';
import 'package:fund_allocations/Widgets/custom_text_widget.dart';

class CustomListTileWidget extends StatelessWidget {
  Widget? leadingWidget;
  Widget? titleWidget;
  Widget? subTitleWidget;
  Widget? trailingWidget;

  CustomListTileWidget(
      {Key? key,
      this.leadingWidget,
      this.subTitleWidget,
      this.titleWidget,
      this.trailingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingWidget,
      title: titleWidget,
      subtitle: subTitleWidget,
      trailing: trailingWidget,
    );
  }
}
