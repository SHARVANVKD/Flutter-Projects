import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fund_allocations/Widgets/custom_container_widget.dart';
import 'package:fund_allocations/Widgets/custom_icon_widget.dart';
import 'package:fund_allocations/Widgets/custom_text_widget.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CustomContainerWidget(
          height: 48,
          width: 48,
          color: Color(0xff3B7CF3),
          childWidget: CustomContainerWidget(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.white, width: 1, style: BorderStyle.solid),
                ),
              ),
              childWidget: CustomIconWidget(
                  icon: Icons.arrow_forward, iconColor: Colors.white)),
        ),
        title: CustomTextWidget(
            text: 'Equity Cash + MTF',
            fontSize: 14,
            textColor: Color(0xff292C33),
            fontWeight: (FontWeight.w700)),
        subtitle: CustomTextWidget(
          text: 'Balance: ₹10,04,288.75',
          fontSize: 12,
          textColor: Color(0xff292C33),
          fontWeight: (FontWeight.w400),
        ),
        trailing: CustomIconWidget(
            icon: (Icons.arrow_downward),
            iconColor: Color(0xff07877B),
            iconSize: 20),
      ),
    );
  }
}
