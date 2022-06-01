import 'package:flutter/material.dart';

class CustomeTextFormFeildWidgets extends StatelessWidget {
  String? labelTexts;
  String? hintText;
  TextEditingController cntrl;
  bool? textVisibility;
  Color? textColor;
  Color? hintTextColor;
  double borderRadius;
  TextInputType inputType;
  String? validateError;
  String validateChecking;
  AutovalidateMode? autoInteraction;
  CustomeTextFormFeildWidgets({
    Key? key,
    required this.cntrl,
    required this.borderRadius,
    required this.inputType,
    required this.validateChecking,
    this.textVisibility,
    this.validateError,
    this.textColor,
    this.hintTextColor,
    this.autoInteraction,
    this.hintText,
    this.labelTexts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: cntrl,
        autovalidateMode: autoInteraction,
        obscureText: textVisibility ?? false,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
            labelText: labelTexts,
            hintText: hintText,
            hintStyle: TextStyle(color: hintTextColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10)),
        validator: (value) {
          if (validateFun(value!)) {
            return null;
          } else
            return validateError;
        });
  }

  bool validateFun(String s) {
    String pattern = validateChecking;
    RegExp feild = RegExp(pattern);
    return (feild.hasMatch(s) && s != null);
  }
}
