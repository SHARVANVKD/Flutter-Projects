import 'package:flutter/material.dart';
import 'package:student_managment/screens_/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

// import 'dart:async';

// import 'package:flutter/widgets.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// TextEditingController _name = TextEditingController();
// TextEditingController _adm_no = TextEditingController();
// TextEditingController _phone = TextEditingController();
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//         appBar: AppBar(title: Text('db operations')),
//         body: Center(
//           child: Column(
//             children: [
//               TextField(
//                 controller: _name,
//               ),
//               TextField(
//                 controller: _adm_no,
//               ),
//               TextField(
//                 controller: _phone,
//               ),
//               ElevatedButton(
//                   child: Text('Insert'),
//                   onPressed: () {
//                     dbOperation();
//                   }),
//             ],
//           ),
//         )),
//   ));
// }

// void dbOperation() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final database = openDatabase(
//     join(await getDatabasesPath(), 'db_students.db'),
//     onCreate: (db, version) {
//       return db.execute(
//         'CREATE TABLE dogs(id INTEGER PRIMARY KEY , name TEXT, adm_no TEXT , phone TEXT)',
//       );
//     },
//     version: 1,
//   );

//   Future<void> insertDog(Dog dog) async {
//     // Get a reference to the database.
//     final db = await database;
//     await db.insert(
//       'dogs',
//       dog.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Dog>> dogs() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('dogs');

//     // Convert the List<Map<String, dynamic> into a List<Dog>.
//     return List.generate(maps.length, (i) {
//       return Dog(
//           name: maps[i]['name'],
//           adm_no: maps[i]['adm_no'],
//           phone: maps[i]['phone']);
//     });
//   }

//   // Future<void> updateDog(Dog dog) async {
//   //   // Get a reference to the database.
//   //   final db = await database;

//   //   // Update the given Dog.
//   //   await db.update(
//   //     'dogs',
//   //     dog.toMap(),
//   //     // Ensure that the Dog has a matching id.
//   //     where: 'id = ?',
//   //     // Pass the Dog's id as a whereArg to prevent SQL injection.
//   //     whereArgs: [dog.id],
//   //   );
//   // }

//   // Future<void> deleteDog(int id) async {
//   //   // Get a reference to the database.
//   //   final db = await database;

//   //   // Remove the Dog from the database.
//   //   await db.delete(
//   //     'dogs',
//   //     // Use a `where` clause to delete a specific dog.
//   //     where: 'id = ?',
//   //     // Pass the Dog's id as a whereArg to prevent SQL injection.
//   //     whereArgs: [id],
//   //   );
//   // }

//   // Create a Dog and add it to the dogs table
//   String names = _name.text.toString();
//   String adm_no = _adm_no.text.toString();
//   String phone = _phone.text.toString();

//   var fido = Dog(name: names, adm_no: adm_no, phone: phone);

//   await insertDog(fido);

//   // Now, use the method above to retrieve all the dogs.
//   print(await dogs()); // Prints a list that include Fido.

//   // Update Fido's age and save it to the database.

//   //await updateDog(fido);

//   // Print the updated results.
//   //print(await dogs()); // Prints Fido with age 42.

//   // Delete Fido from the database.
//   // await deleteDog(fido.id);

//   // Print the list of dogs (empty).
//   // print(await dogs());
// }

// class Dog {
//   final String name;
//   final String adm_no;
//   final String phone;

//   const Dog({
//     required this.name,
//     required this.adm_no,
//     required this.phone,
//   });
//   // columns in the database.
//   Map<String, dynamic> toMap() {
//     return {'name': name, 'adm_no': adm_no, 'phone': phone};
//   }

//   @override
//   String toString() {
//     return 'Dog{ name: $name, adm_no: $adm_no , phone : $phone}';
//   }
// }
