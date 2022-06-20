import 'dart:convert';

class Fruitss {
  final int? id;
  final String? title;
  final int? UserId;

  Fruitss(
    this.UserId,
    this.id,
    this.title,
  );

  factory Fruitss.fromJson(Map<String, dynamic> json) {
    return Fruitss(json['userId'], json['id'], json['title']);
  }
  // List<Fruitss> fruitModelFromJson(String str) =>
  //     List<Fruitss>.from(json.decode(str).map((x) => Fruitss.fromJson(x)));

// String ShopModelToJson(List<Fruitss> data) =>

//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

}
