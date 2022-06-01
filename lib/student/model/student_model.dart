class StudentModel {
  int? id;
  String name;
  String adm_no;
  String phone;
  String password;

  StudentModel(
      {this.id,
      required this.name,
      required this.adm_no,
      required this.phone,
      required this.password});

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "adm_no": adm_no,
        "phone": phone,
        "password": password
      };

  factory StudentModel.fromMap(Map<String, dynamic> json) => StudentModel(
      id: json["id"],
      name: json["name"],
      adm_no: json["adm_no"],
      phone: json["phone"],
      password: json["password"]);
}
