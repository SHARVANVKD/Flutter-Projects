import 'dart:convert';
import 'package:api_sample/greekSample/model.dart';
import 'package:http/http.dart' as http;

Future<List<Fruit>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://jsonkeeper.com/b/WO6S'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Fruit>((json) => Fruit.fromJson(json)).toList();
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
