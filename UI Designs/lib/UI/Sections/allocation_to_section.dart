import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_allocations/Widgets/custom_text_widget.dart';
import 'package:fund_allocations/cubit/cubit.dart';

class AllocationToSection extends StatefulWidget {
  const AllocationToSection({Key? key}) : super(key: key);

  @override
  State<AllocationToSection> createState() => _AllocationToSectionState();
}

class _AllocationToSectionState extends State<AllocationToSection> {
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        bottomSheetItems(
            titleText: 'Equity Cash', values: 1, sizedBoxWidth: 200),
        bottomSheetItems(
            titleText: 'Equity Cash + MTF', values: 2, sizedBoxWidth: 188),
        bottomSheetItems(
            titleText: 'Equity F&O', values: 3, sizedBoxWidth: 240),
        bottomSheetItems(
            titleText: 'Currency F&O', values: 4, sizedBoxWidth: 250),
        bottomSheetItems(titleText: 'MCX F&O', values: 5, sizedBoxWidth: 245),
        bottomSheetItems(titleText: 'NCDEX F&O', values: 6, sizedBoxWidth: 240),
      ],
    );
  }

  Widget bottomSheetItems({
    required double values,
    titleText,
    double? sizedBoxWidth,
  }) {
    return Row(children: [
      BlocBuilder<CubitCubit, CubitState>(
        builder: (context, state) {
          return Radio(
              activeColor: Color(0xff07877B),
              focusColor: Colors.green,
              value: values,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = value as double;
                  context.read<CubitCubit>().radioToClick(values: _value);
                });
              });
        },
      ),
      CustomTextWidget(
        text: titleText,
        fontSize: 14,
        fontWeight: (FontWeight.w400),
        textColor: Color(0xff292C33),
      ),
      SizedBox(
        width: sizedBoxWidth,
      ),
    ]);
  }
}
