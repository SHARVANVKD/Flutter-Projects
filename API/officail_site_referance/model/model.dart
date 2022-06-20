class Fruits {
  final int? id;
  final String? title;
  final int? UserId;

  Fruits(
    this.UserId,
    this.id,
    this.title,
  );

  factory Fruits.fromJson(Map<String, dynamic> json) {
    return Fruits(json['userId'], json['id'], json['title']);
  }
}
