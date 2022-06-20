class Fruit {
  final String courseName;
  final String courseMode;
  final String courseImage;
  Fruit(
    this.courseMode,
    this.courseName,
    this.courseImage,
  );

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(json['courseName'], json['courseMode'], json['courseimg']);
  }
}
