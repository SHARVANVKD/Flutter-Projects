import 'dart:convert';

import 'package:api_sample/officail_site_referance/model/model.dart';

List<Fruits> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Fruits>((json) => Fruits.fromJson(json)).toList();
}
