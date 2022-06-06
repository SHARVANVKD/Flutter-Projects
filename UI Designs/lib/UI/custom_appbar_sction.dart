import 'package:flutter/material.dart';
import 'package:fund_allocations/Widgets/custom_icon_widget.dart';
import 'package:fund_allocations/Widgets/custom_sizedbox_widget.dart';
import 'package:fund_allocations/Widgets/custom_text_widget.dart';

class CustomAppbarSection extends StatelessWidget {
  const CustomAppbarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: CustomSizedBoxWidget(
        height: 68,
        width: 376,
        widget: Row(
          children: [
            CustomIconWidget(icon: (Icons.arrow_back), iconSize: 20),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: CustomTextWidget(
                  text: 'Funds',
                  fontSize: 16,
                  fontWeight: (FontWeight.w500),
                  textColor: (Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
