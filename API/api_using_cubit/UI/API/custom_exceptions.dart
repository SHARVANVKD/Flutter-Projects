import 'package:api_sample/api_using_cubit/UI/Screens/home_page.dart';
import 'package:api_sample/api_using_cubit/Widgets/custom_snackBar_widget.dart';
import 'package:flutter/material.dart';

dynamic NoInternetException(String message, BuildContext ctx) {
  snack(ctx: ctx, message: message);
  // NoInternetException(this.message, this.ctx);
}

dynamic NoServiceFoundException(String message, BuildContext ctx) {
  snack(ctx: ctx, message: message);
  // NoInternetException(this.message, this.ctx);
}

dynamic InvalidFormatException(String message, BuildContext ctx) {
  snack(ctx: ctx, message: message);
  // NoInternetException(this.message, this.ctx);
}

dynamic TimeOutException(String message, BuildContext ctx) {
  snack(ctx: ctx, message: message);
  Navigator.push(
    ctx,
    MaterialPageRoute(builder: (context) => APIHomePage()),
  );
  // NoInternetException(this.message, this.ctx);
}

dynamic UnknownException(String message, BuildContext ctx) {}

dynamic nullException() {}
