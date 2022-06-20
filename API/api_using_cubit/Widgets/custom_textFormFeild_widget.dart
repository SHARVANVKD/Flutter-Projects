import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFormFeildWidget extends StatelessWidget {
  CustomTextFormFeildWidget(
      {Key? key,
      required this.cntrl,
      this.labelText,
      this.keyboardType,
      required this.validator,
      this.defaultErrorMessage,
      this.onFieldSubmit,
      this.onChange})
      : super(key: key);

  String? labelText;
  TextEditingController cntrl;
  TextInputType? keyboardType;
  Validator validator;
  String? defaultErrorMessage;
  final Function(String)? onFieldSubmit;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: cntrl,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      onFieldSubmitted: onFieldSubmit,
      onChanged: onChange,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        switch (validator) {
          case Validator.defaultValidator:
            return emptyValidation(
                value.toString(), defaultErrorMessage ?? 'Some thing Error');
          case Validator.defaultValidator:
            return emptyValidation(cntrl.value.toString(),
                defaultErrorMessage ?? 'Some thing Error');
        }
      },
    );
  }
}

enum Validator { defaultValidator }

dynamic emptyValidation(String value, String errorString) {
  if (value.isEmpty) {
    return errorString;
  }
  return null;
}
