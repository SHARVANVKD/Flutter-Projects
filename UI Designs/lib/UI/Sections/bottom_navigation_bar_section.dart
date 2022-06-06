import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_allocations/Widgets/custom_container_widget.dart';
import 'package:fund_allocations/Widgets/custom_divider_widget.dart';
import 'package:fund_allocations/Widgets/custom_icon_widget.dart';
import 'package:fund_allocations/Widgets/custom_padding_widget.dart';
import 'package:fund_allocations/Widgets/custom_sizedbox_widget.dart';
import 'package:fund_allocations/Widgets/custom_text_widget.dart';
import 'package:fund_allocations/cubit/cubit.dart';

class BottomNavigationBarSection extends StatelessWidget {
  const BottomNavigationBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 368,
      child: ElevatedButton(
        onPressed: () {
          reAllocateBottomSheet(context);
        },
        child: CustomTextWidget(
          text: 'Reallocate',
          textColor: (Colors.white),
          fontWeight: (FontWeight.w700),
          fontSize: 14,
        ),
      ),
    );
  }

  void reAllocateBottomSheet(context) {
    showModalBottomSheet<void>(
      constraints: BoxConstraints(maxHeight: 282),
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
          childWidget: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomContainerWidget(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                      color: Color(0xff0BAA60),
                      borderRadius: BorderRadius.circular(100)),
                  childWidget: CustomIconWidget(
                    icon: (Icons.check),
                    iconColor: Colors.white,
                  ),
                ),
                CustomTextWidget(
                  text: 'Allocation Successfull',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textColor: Color(0xff292C33),
                ),
                CustomSizedBoxWidget(
                  height: 50,
                ),
                CustomPaddingWidget(
                  left: 16,
                  bottom: 44,
                  top: 16,
                  right: 16,
                  childWidget: Row(
                    children: [
                      CustomSizedBoxWidget(
                        height: 42,
                        width: 105,
                        widget: Column(
                          children: [
                            BlocBuilder<CubitCubit, CubitState>(
                              builder: (context, state) {
                                return CustomTextWidget(
                                  text: state.nameAllocationFrom.toString(),
                                  fontSize: 12,
                                  fontWeight: (FontWeight.w600),
                                );
                              },
                            ),
                            BlocBuilder<CubitCubit, CubitState>(
                              builder: (context, state) {
                                return CustomTextWidget(
                                  text: '-' + state.allocationFrom.toString(),
                                  fontSize: 12,
                                  fontWeight: (FontWeight.w700),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      CustomSizedBoxWidget(
                        width: 65,
                      ),
                      CustomContainerWidget(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 233, 220, 198),
                            borderRadius: BorderRadius.circular(100)),
                        childWidget: CustomIconWidget(
                          icon: (Icons.arrow_forward),
                          iconColor: Color(0xffE7A640),
                        ),
                      ),
                      CustomSizedBoxWidget(
                        width: 65,
                      ),
                      CustomSizedBoxWidget(
                        height: 42,
                        width: 105,
                        widget: Column(
                          children: [
                            BlocBuilder<CubitCubit, CubitState>(
                              builder: (context, state) {
                                return CustomTextWidget(
                                  text: state.nameAllocationTo.toString(),
                                  fontSize: 12,
                                  fontWeight: (FontWeight.w600),
                                );
                              },
                            ),
                            BlocBuilder<CubitCubit, CubitState>(
                              builder: (context, state) {
                                return CustomTextWidget(
                                  text: '+' + state.allocationFrom.toString(),
                                  fontSize: 12,
                                  fontWeight: (FontWeight.w700),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
