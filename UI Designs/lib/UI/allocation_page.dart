import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_allocations/UI/Sections/allocation_from_section.dart';
import 'package:fund_allocations/UI/Sections/allocation_to_section.dart';
import 'package:fund_allocations/UI/Sections/bottom_navigation_bar_section.dart';
import 'package:fund_allocations/Widgets/custom_container_widget.dart';
import 'package:fund_allocations/Widgets/custom_card_widget.dart';
import 'package:fund_allocations/Widgets/custom_divider_widget.dart';
import 'package:fund_allocations/Widgets/custom_icon_widget.dart';
import 'package:fund_allocations/Widgets/custom_list_tile_widget.dart';
import 'package:fund_allocations/Widgets/custom_padding_widget.dart';
import 'package:fund_allocations/Widgets/custom_sizedbox_widget.dart';
import 'package:fund_allocations/Widgets/custom_text_widget.dart';
import 'package:fund_allocations/Widgets/custom_texteild_widget.dart';
import 'package:fund_allocations/cubit/cubit.dart';

class AllocationPage extends StatelessWidget {
  AllocationPage({Key? key}) : super(key: key);

  TextEditingController numCntrl = TextEditingController();
  TextEditingController all_from = TextEditingController();

  double allocateFrom = 404288.75;

  //SingingCharacter? _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    // print(screenSize.height);
    // print(screenSize.width)
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomContainerWidget(
            height: 104,
            color: Color(0xffF5F8FA),
            childWidget: CustomPaddingWidget(
              left: 16,
              right: 16,
              top: 16,
              bottom: 16,
              childWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Amount',
                    fontSize: 14,
                    fontWeight: (FontWeight.normal),
                    textColor: Color(0xff292C33),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 48,
                      child: CustomTextFeildWidget(
                        cntrl: numCntrl,
                        fillColor: Colors.white,
                        focuBordersColor: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w600,
                        icons: Icon(
                          Icons.currency_rupee,
                          size: 20,
                          color: Color(0xff292c33),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              bottomSheetFromSection(
                  context: context, text: 'Allocation From', whichOne: true);
            },
            child: CustomPaddingWidget(
              top: 20,
              bottom: 10,
              right: 16,
              left: 16,
              childWidget: CustomSizedBoxWidget(
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
                    CustomCardWidget(
                        childWidget: CustomListTileWidget(
                          leadingWidget: CustomContainerWidget(
                            height: 48,
                            width: 48,
                            color: Color(0xff3B7CF3),
                            childWidget: CustomContainerWidget(
                                height: 24,
                                width: 24,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                                childWidget: CustomIconWidget(
                                    icon: Icons.arrow_forward,
                                    iconColor: Colors.white)),
                          ),
                          titleWidget: BlocBuilder<CubitCubit, CubitState>(
                            builder: (context, state) {
                              return CustomTextWidget(
                                  text: state.nameAllocationFrom.toString(),
                                  fontSize: 14,
                                  textColor: Color(0xff292C33),
                                  fontWeight: (FontWeight.w700));
                            },
                          ),
                          subTitleWidget: BlocBuilder<CubitCubit, CubitState>(
                            builder: (context, state) {
                              //print(state.allocationFrom);
                              return CustomTextWidget(
                                //text: 'Balance: ₹'.st,
                                text: state.allocationFrom.toString(),
                                fontSize: 12,
                                textColor: Color(0xff292C33),
                                fontWeight: (FontWeight.w400),
                              );
                            },
                          ),
                          // subTitleWidget: CustomTextFeildWidget(cntrl:all_from, ),
                          trailingWidget: CustomIconWidget(
                              icon: (Icons.arrow_downward),
                              iconColor: Color(0xff07877B),
                              iconSize: 20),
                        ),
                        shapeBorder: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey.withOpacity(.1),
                            width: .4,
                          ),
                        ),
                        elevation: 1),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              bottomSheetFromSection(
                  context: context, text: 'Allocate To', whichOne: false);
            },
            child: CustomPaddingWidget(
              left: 16,
              right: 16,
              top: 20,
              bottom: 10,
              childWidget: CustomSizedBoxWidget(
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
                    CustomCardWidget(
                        childWidget: CustomListTileWidget(
                          leadingWidget: CustomContainerWidget(
                            height: 48,
                            width: 48,
                            color: Color(0xff9768E1),
                            childWidget: CustomContainerWidget(
                                height: 24,
                                width: 24,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                                childWidget: CustomIconWidget(
                                    icon: Icons.arrow_back,
                                    iconColor: Colors.white)),
                          ),
                          titleWidget: BlocBuilder<CubitCubit, CubitState>(
                            builder: (context, state) {
                              return CustomTextWidget(
                                  text: state.nameAllocationTo.toString(),
                                  fontSize: 14,
                                  textColor: Color(0xff292C33),
                                  fontWeight: (FontWeight.w700));
                            },
                          ),
                          subTitleWidget: BlocBuilder<CubitCubit, CubitState>(
                            builder: (context, state) {
                              return CustomTextWidget(
                                text: state.allocationTo.toString(),
                                fontSize: 12,
                                textColor: Color(0xff292C33),
                                fontWeight: (FontWeight.w400),
                              );
                            },
                          ),
                          trailingWidget: CustomIconWidget(
                              icon: (Icons.arrow_downward),
                              iconColor: Color(0xff07877B),
                              iconSize: 20),
                        ),
                        shapeBorder: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey.withOpacity(.1),
                            width: .4,
                          ),
                        ),
                        elevation: 1),
                  ],
                ),
              ),
            ),
          ),
          CustomSizedBoxWidget(height: 135),
          BottomNavigationBarSection()
        ],
      ),
    );
  }

  void bottomSheetFromSection({context, bool? whichOne, String? text}) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return CustomContainerWidget(
          // color: Color(0xffFFFFFF),
          decoration: const BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          align: Alignment.topLeft,
          childWidget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomPaddingWidget(
                top: 20,
                bottom: 10,
                right: 16,
                left: 16,
                childWidget: CustomTextWidget(
                  text: text!,
                  fontSize: 16,
                  fontWeight: (FontWeight.w600),
                  textColor: Color(0xff292C33),
                ),
              ),
              CustomDividerWidget(
                thickness: 2,
              ),
              if (whichOne == true)
                AllocationFormSectionFrom()
              else
                AllocationToSection()
            ],
          ),
        );
      },
    );
  }
}
