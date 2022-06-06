import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_allocations/Widgets/custom_text_widget.dart';
import 'package:fund_allocations/cubit/cubit.dart';

class AllocationFormSectionFrom extends StatefulWidget {
  const AllocationFormSectionFrom({Key? key}) : super(key: key);

  @override
  State<AllocationFormSectionFrom> createState() =>
      _AllocationFormSectionFromState();
}

class _AllocationFormSectionFromState extends State<AllocationFormSectionFrom> {
  //SingingCharacter? _character = SingingCharacter.lafayette;
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        bottomSheetItems(
            titleText: 'Equity Cash',
            trailingText: '₹10,04,288.75',
            values: 1,
            sizedBoxWidth: 200),
        bottomSheetItems(
            titleText: 'Equity Cash + MTF',
            trailingText: '₹10,000',
            values: 2,
            sizedBoxWidth: 188),
        bottomSheetItems(
            titleText: 'Equity F&O',
            trailingText: '₹15,000',
            values: 3,
            sizedBoxWidth: 240),
        bottomSheetItems(
            titleText: 'Currency F&O',
            trailingText: '₹0',
            values: 4,
            sizedBoxWidth: 250),
        bottomSheetItems(
            titleText: 'MCX F&O',
            trailingText: '₹10,000',
            values: 5,
            sizedBoxWidth: 245),
        bottomSheetItems(
            titleText: 'NCDEX F&O',
            trailingText: '₹7900',
            values: 6,
            sizedBoxWidth: 240),
      ],
    );
  }

  Widget bottomSheetItems({
    required double values,
    trailingText,
    titleText,
    double? sizedBoxWidth,
  }) {
    return BlocBuilder<CubitCubit, CubitState>(
      builder: (context, state) {
        return Row(children: [
          Radio(
              activeColor: Color(0xff07877B),
              value: values,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = value as double;
                  context.read<CubitCubit>().radioFromClick(values: _value);
                });
              }),
          CustomTextWidget(
            text: titleText,
            fontSize: 14,
            fontWeight: (FontWeight.w400),
            textColor: Color(0xff292C33),
          ),
          SizedBox(
            width: sizedBoxWidth,
          ),
          CustomTextWidget(
            text: trailingText,
            fontSize: 12,
            fontWeight: (FontWeight.w400),
            textColor: Color(0xff7A828F),
          )
        ]);
      },
    );
  }
}
