import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({Key? key, this.btnText, required this.btnAction})
      : super(key: key);

  String? btnText;
  Function() btnAction;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        btnAction();
      },
      child: Text(btnText!),
    );
  }
}
