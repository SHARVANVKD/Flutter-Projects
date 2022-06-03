import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFeildWidget extends StatelessWidget {
  String? labelTexts;
  String? hintText;
  Icon? icons;
  TextEditingController cntrl;
  Color? textColor;
  Color? hintTextColor;
  Color? focuBordersColor;
  Color? fillColor;
  double? borderRadius;
  TextInputType? inputType;
  Function? onChanged;
  FontWeight? fontWeight;
  CustomTextFeildWidget(
      {Key? key,
      required this.cntrl,
      this.borderRadius,
      this.inputType,
      this.textColor,
      this.hintTextColor,
      this.hintText,
      this.onChanged,
      this.labelTexts,
      this.icons,
      this.focuBordersColor,
      this.fillColor,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        onChanged;
      },
      keyboardType: TextInputType.emailAddress,
      controller: cntrl,
      style: TextStyle(color: textColor, fontWeight: fontWeight, fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        labelText: labelTexts,
        hintText: hintText,
        prefixIcon: icons,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focuBordersColor ?? Colors.white),
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
        ),
        fillColor: fillColor,
        hintStyle: TextStyle(color: hintTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
        ),
      ),
    );
  }
}
