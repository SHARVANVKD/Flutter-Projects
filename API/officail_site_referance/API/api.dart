import 'dart:convert';
import 'package:api_sample/officail_site_referance/API/service_helper.dart';
import 'package:api_sample/officail_site_referance/model/model.dart';
import 'package:http/http.dart' as http;

Future<List<Fruits>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if (response.statusCode == 200) {
    return parseProducts(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

Future<void> createAlbum({String? title, String? id, String? userId}) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    body: jsonEncode(<String, String>{
      'UserId': userId!,
      'title': title!,
    }),
  );

  (response.statusCode == 201)
      ? print('inserted data $title')
      : print('insertion failed');
  // throw Exception('Failed to create album.');
}

Future<void> deleteAlbum({String? id}) async {
  final http.Response response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
  );
  (response.statusCode == 200)
      ? print('deleted $id ')
      : print('deletion failed');
}

Future<void> updateAlbum({String? title, String? id, String? userId}) async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
    body: jsonEncode(<String, String>{'title': title!, 'UserId': userId!}),
  );
  (response.statusCode == 200)
      ? print('Updates $title')
      : print('Updation failed');
}
