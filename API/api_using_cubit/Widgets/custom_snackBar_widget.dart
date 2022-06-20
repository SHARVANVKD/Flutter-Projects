import 'package:flutter/material.dart';

dynamic snack({required BuildContext ctx, required String message}) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(message)));
}
