import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_managment/model/student_model.dart';

class AllDetails extends StatefulWidget {
  const AllDetails({Key? key}) : super(key: key);

  @override
  State<AllDetails> createState() => _AllDetailsState();
}

class _AllDetailsState extends State<AllDetails> {
  @override
  int listCount = 0;
  late List<Map<String, dynamic>> list;

  void initState() {
    dbOperation();
    // TODO: implement initState
    super.initState();
  }

  dbOperation() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'student.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT, adm_no TEXT , phone TEXT , pwd TEXT , email TEXT)');
    });

    list = await database.rawQuery('SELECT * FROM dogs');
    listCount = list.length;
    print(listCount);
    await database.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('All Details')),
        body: ListView.separated(
          itemCount: listCount,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(list[index]["name"]),
                Text(list[index]["phone"]),
                Text(list[index]["pwd"]),
                ElevatedButton(
                  onPressed: () {
                    String nameDelete = list[index]["name"];
                    int rowNo = index;
                    deleteFun(nameDelete, rowNo);
                  },
                  child: Text('Delete'),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Edit'))
              ],
            );
          },
        ));
  }

  Future<void> deleteFun(String nameDelete, int rowNo) async {
    String deletedName = nameDelete;
    int RowNo = rowNo;
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'student.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT, adm_no TEXT , phone TEXT , pwd TEXT , email TEXT)');
    });

    int count = await database.rawDelete(
      'DELETE FROM dogs WHERE name =  ?',
      ['$deletedName'],
    );
    print(deletedName);
    setState(() {
      list.removeAt(RowNo);
    });
  }
}
