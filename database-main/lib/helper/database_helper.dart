import 'package:login/model/ModelClass.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final _databaseName = "My_Database.db";
  static final _databaseVersion = 1;

  Future<Database> _initDatabase() async{
    String path = await getDatabasesPath();
    return openDatabase(join(path,_databaseName),
    onCreate: (db, version) async {
      await db.execute("CREATE TABLE STUDENT(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, email TEXT NOT NULL, dob TEXT NOT NULL, course TEXT NOT NULL, adm_no TEXT NOT NULL, mob TEXT NOT NULL, password TEXT NOT NULL)");
    },version: _databaseVersion);
  }

  Future<bool> insertdata(ModelClass modelClass) async {
    final Database db = await _initDatabase();
    db.insert("STUDENT", modelClass.toMap());
    return true;
  }

  Future<List<ModelClass>> getData() async {
    final Database db = await _initDatabase();
    final List<Map<String, Object?>> datas = await db.query("STUDENT");
    return datas.map((e) => ModelClass.fromMap(e)).toList();
  }

  Future<void> update(ModelClass modelClass, int id) async{
    final Database db = await _initDatabase();
    await db.update("STUDENT", modelClass.toMap(), where: "id=?", whereArgs: [id]);
  }

  Future<List<ModelClass>> check_log(String username, String password) async{
    final Database db = await _initDatabase();
    List<Map<String, Object?>> log = await db.rawQuery("SELECT * FROM STUDENT WHERE email = '$username' AND password = '$password' ");
    return log.map((e) => ModelClass.fromMap(e)).toList();
  }

  Future<void> delete(int id) async{
    final Database db = await _initDatabase();
    await db.delete("STUDENT", where: "id=?", whereArgs: [id]);
  }

 }