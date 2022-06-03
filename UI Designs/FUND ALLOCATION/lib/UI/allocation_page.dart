import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fund_allocations/Widgets/custom_container_widget.dart';
import 'package:fund_allocations/Widgets/custom_list_tile_widget.dart';
import 'package:fund_allocations/Widgets/custom_sizedbox_widget.dart';
import 'package:fund_allocations/Widgets/custom_text_widget.dart';
import 'package:fund_allocations/Widgets/custom_texteild_widget.dart';

class AllocationPage extends StatelessWidget {
  AllocationPage({Key? key}) : super(key: key);

  TextEditingController numCntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainerWidget(
          height: 104,
          color: Color(0xffF5F8FA),
          childWidget: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: 'Amount',
                  fontSize: 14,
                  fontWeight: (FontWeight.normal),
                  textColor: Color(0xff292C33),
                ),
                SizedBox(
                  height: 48,
                  child: CustomTextFeildWidget(
                    cntrl: numCntrl,
                    fillColor: Colors.white,
                    focuBordersColor: Color(0xff292C33),
                    fontWeight: FontWeight.w600,
                    icons: Icon(
                      Icons.currency_rupee,
                      size: 20,
                      color: Color(0xff292c33),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 16, right: 16),
          child: CustomSizedBoxWidget(
            height: 110,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: 'Allocate From',
                  fontSize: 14,
                  fontWeight: (FontWeight.normal),
                  textColor: Color(0xff292C33),
                ),
                CustomSizedBoxWidget(
                  height: 10,
                ),
                CustomListTileWidget(),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 16, right: 16),
          child: CustomSizedBoxWidget(
            height: 110,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: 'Allocate To',
                  fontSize: 14,
                  fontWeight: (FontWeight.normal),
                  textColor: Color(0xff292C33),
                ),
                CustomSizedBoxWidget(
                  height: 10,
                ),
                CustomListTileWidget(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
