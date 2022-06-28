import 'package:flutter/material.dart';

class CustomTextFeilds extends StatelessWidget {
  CustomTextFeilds(
      {Key? key,
      required this.cntrl,
      this.hintText,
      this.errorText,
      this.obscureText})
      : super(key: key);

  TextEditingController cntrl;
  String? hintText;
  String? errorText;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: cntrl,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: hintText, border: InputBorder.none),
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}
