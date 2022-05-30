import 'package:sharwan/model/student_model.dart';
import 'package:sqflite/sqflite.dart';

late Database _db;

Future<void> initilizeDatabase() async {
  _db = await openDatabase(
    'db_student.db',
    version: 1,
    onCreate: (Database database, int version) async {
      await database.execute(
          'CREATE TABLE tbl_student(id INTEGER PRIMARY KEY, name TEXT, email TEXT ,adm_no TEXT ,phone TEXT ,pwd TEXT )');
    },
  );
}

//get data

Future<List<StudentModel>> getAllDatas() async {
  final _values = await _db.rawQuery('SELECT * FROM tbl_student');
  final List<Map<String, Object?>> details = _values;
  return details.map((maps) => StudentModel.fromMap(maps)).toList();

  print(_values);
}

//insert
Future<void> insertStudents(StudentModel value) async {
  await _db.rawInsert(
      'INSERT INTO tbl_student(name,email,adm_no,phone,pwd) VALUES(?,?,?,?,?)',
      [value.name, value.email, value.adm_number, value.phone, value.password]);
  _db.close();
}

//check ;login

Future<void> chcekLogin({required String adm_no, required String pwd}) async {
  List<Map> list = await _db.rawQuery(
      "SELECT * FROM tbl_student WHERE adm_no = '$adm_no' and pwd = '$pwd' ");

  int result = 0;
  result = list.length;
  // print(result);
  print(result);
}
