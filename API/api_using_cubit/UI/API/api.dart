import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:api_sample/api_using_cubit/UI/API/custom_exceptions.dart';
import 'package:api_sample/api_using_cubit/UI/API/service_helper.dart';
import 'package:api_sample/api_using_cubit/UI/Models/model.dart';
import 'package:api_sample/api_using_cubit/UI/Screens/create_new_data.dart';
import 'package:api_sample/api_using_cubit/Widgets/custom_snackBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Model>> fetchProducts(BuildContext ctx) async {
  try {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'))
        .timeout(Duration(milliseconds: 8000));

    if (200 == response.statusCode) {
      return parseProducts(response.body);
    } else if (response.statusCode == 404) {
      snack(ctx: ctx, message: 'Not Collecting Data ...!   404 exception');
      return Future.value();
    } else {
      snack(ctx: ctx, message: 'Somthing Error');
      return Future.value();
    }
  } on SocketException catch (e) {
    throw NoInternetException('No Internet', ctx);
  } on HttpException {
    throw NoServiceFoundException('No Service Found', ctx);
  } on FormatException {
    throw InvalidFormatException('Invalid Data Format', ctx);
  } on TimeoutException catch (e) {
    throw TimeOutException('No Internet Connection', ctx);
  } catch (e) {
    throw UnknownException('something exception', ctx);
  }
}

dynamic createAlbum(Model model, BuildContext ctx) async {
  dynamic res;
  try {
    final response = await http
        .post(
          Uri.parse('https://jsonplaceholder.typicode.com/albums'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'title': model.title!,
            'UserId': model.UserId.toString(),
          }),
        )
        .timeout(Duration(milliseconds: 8000));
    if (response.statusCode == 201) {
      snack(ctx: ctx, message: 'Registered');
      // print(response.body);
      res = Model.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      snack(ctx: ctx, message: 'Not Registered ...!   404 exception');
      res = null;
    } else {
      snack(ctx: ctx, message: 'something error');
      res = null;
    }
  } on SocketException catch (e) {
    throw NoInternetException('No Internet', ctx);
  } on HttpException {
    throw NoServiceFoundException('No Service Found', ctx);
  } on TimeoutException catch (e) {
    throw TimeOutException('Slow Internet Connection', ctx);
  } on FormatException {
    throw InvalidFormatException('Invalid Data Format', ctx);
  } catch (e) {
    throw UnknownException(e.toString(), ctx);
  }
  return res;
}

dynamic deleteAlbum({String? id, required BuildContext ctx}) async {
  dynamic res;
  try {
    final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).timeout(Duration(milliseconds: 8000));
    if (response.statusCode == 200) {
      snack(ctx: ctx, message: 'Deleted ...!');
      //print(response.body);
      res = Model.fromJson(jsonDecode(response.body));
      print(res);
    } else if (response.statusCode == 404) {
      snack(ctx: ctx, message: 'Not Deleted ...!   404 exception');
      res = null;
    } else {
      snack(ctx: ctx, message: 'something error');
      res = null;
    }
    return res;
  } on SocketException {
    throw snack(ctx: ctx, message: 'No Internet');
  } on HttpException {
    throw snack(ctx: ctx, message: 'No Service Found');
  } on TimeoutException catch (e) {
    throw TimeOutException('No Internet Connection', ctx);
  } on FormatException {
    throw snack(ctx: ctx, message: 'Invalid Data Format');
  } catch (e) {
    throw snack(ctx: ctx, message: 'Unknown Exception');
  }
}

dynamic updateAlbum({required BuildContext ctx, required Model model}) async {
  dynamic res;
  try {
    int id = model.id!;
    final response = await http
        .put(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'title': model.title!,
            'UserId': model.UserId.toString(),
          }),
        )
        .timeout(Duration(milliseconds: 8000));
    if (response.statusCode == 200) {
      resultUpdateCheck = 1;
      snack(ctx: ctx, message: 'Updated');
      // print(response.body);
      res = Model.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      snack(ctx: ctx, message: 'Not Updated ...!   404 exception');
      res = null;
    } else {
      snack(ctx: ctx, message: 'something error');
      res = null;
    }
    return res;
  } on SocketException catch (e) {
    throw NoInternetException('No Internet', ctx);
  } on HttpException {
    throw NoServiceFoundException('No Service Found', ctx);
  } on FormatException {
    throw InvalidFormatException('Invalid Data Format', ctx);
  } on TimeoutException catch (e) {
    throw TimeOutException('No Internet Connection', ctx);
  } catch (e) {
    throw UnknownException(e.toString(), ctx);
  }
}
