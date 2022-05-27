class Dog {
  final String name;
  final String adm_no;
  final String phone;
  final String pwd;
  final String email;

  const Dog(
      {required this.name,
      required this.adm_no,
      required this.phone,
      required this.pwd,
      required this.email});
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'adm_no': adm_no,
      'phone': phone,
      'pwd': pwd,
      'email': email
    };
  }

  @override
  String toString() {
    return 'Dog{ name: $name, adm_no: $adm_no , phone : $phone , password : $pwd , email : $email}';
  }
}
