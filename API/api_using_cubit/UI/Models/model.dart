class Model {
  int? UserId;
  int? id;
  String? title;

  Model(
    this.UserId,
    this.id,
    this.title,
  );

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(json['userId'], json['id'], json['title']);
  }
}
