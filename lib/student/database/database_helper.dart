import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:students/student/model/student_model.dart';

class DatabaseHelper {
  static final _databaseName = "studentDatabase.db";
  static final _databaseVersion = 1;
  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'Student.db'),
        onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE STUDENT(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, adm_no TEXT NOT NULL, phone TEXT NOT NULL, password TEXT NOT NULL)");
    }, version: 1);
  }

  Future<bool> insertdata(StudentModel model) async {
    final Database db = await _initDatabase();
    db.insert("STUDENT", model.toMap());
    return true;
  }

  Future<List<StudentModel>> getData() async {
    final Database db = await _initDatabase();
    final List<Map<String, Object?>> datas = await db.query("STUDENT");
    return datas.map((e) => StudentModel.fromMap(e)).toList();
  }

  Future<List<StudentModel>> check_log(
      String admissionNumber, String password) async {
    final Database db = await _initDatabase();
    List<Map<String, Object?>> log = await db.rawQuery(
        "SELECT * FROM STUDENT WHERE adm_no = '$admissionNumber' AND password = '$password' ");
    return log.map((e) => StudentModel.fromMap(e)).toList();
  }
}
