import 'dart:convert';
import 'package:api_sample/api_using_cubit/UI/Models/model.dart';

List<Model> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Model>((json) => Model.fromJson(json)).toList();
}
