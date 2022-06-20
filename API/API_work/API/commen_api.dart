import 'dart:convert';
import 'package:api_sample/API_work/model/model.dart';
import 'package:http/http.dart' as http;

// late final response;

// Future<http.Response> getUrl(String id) {
//   return response =
//       http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'));
// }
List<Fruitss> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Fruitss>((json) => Fruitss.fromJson(json)).toList();
}

Future<List<Fruitss>> fetchProducts({String? id}) async {
  late final response;
  (id != null)
      ? (response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id')))
      : (response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums')));

  // response =
  //     await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if (response.statusCode == 200) {
    if (id != null) {
      return parseProducts(response.body);
    } else {
      return parseProducts(response.body);
    }
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
