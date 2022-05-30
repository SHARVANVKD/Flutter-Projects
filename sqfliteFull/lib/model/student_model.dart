class StudentModel {
  int? id;
  final String name;
  final String email;
  // ignore: non_constant_identifier_names
  final String adm_number;
  final String phone;
  final String password;

  StudentModel(
      {this.id,
      required this.name,
      required this.email,
      required this.adm_number,
      required this.phone,
      required this.password});

//selection purpose

  static StudentModel fromMap(Map<String, Object?> maps) {
    //as aakunnath varunnath object aaayathu kondanu
    final ids = maps['id'] as int;
    final names = maps['name'] as String;
    final phones = maps['phone'] as String;
    final emails = maps['email'] as String;
    final admissionNos = maps['adm_no'] as String;
    final passwords = maps['pwd'] as String;

    return StudentModel(
        id: ids,
        name: names,
        email: emails,
        adm_number: admissionNos,
        phone: phones,
        password: passwords);
  }
}
