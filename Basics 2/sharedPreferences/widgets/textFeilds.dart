
import 'package:flutter/material.dart';

class TextFeild extends StatelessWidget {
  final String labelText ;
  final TextEditingController controller;
  const TextFeild({Key? key, required this.labelText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          labelText: labelText,
        ),

      ),
    );
  }
}