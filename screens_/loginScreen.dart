// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_managment/model/student_model.dart';
import 'package:student_managment/screens_/allDetails.dart';
import 'package:student_managment/screens_/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _admission_no = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: SizedBox(
          height: 550,
          width: 400,
          child: Card(
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, left: 60, bottom: 20),
                    child: Text(
                      'Login Screen',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    child: TextFormField(
                      controller: _admission_no,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Adminssion Number",
                          fillColor: Colors.white70),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 5) {
                          return 'Enter valid Adminssion Number';
                        } else {
                          final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
                          if (!validCharacters.hasMatch(value)) {
                            return 'Enter valid Adminssion Number';
                          } else {
                            return null;
                          }
                        }
                        ;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    child: TextFormField(
                      controller: _pwd,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Password (Minimum 6 Letter)",
                          fillColor: Colors.white70),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter valid Password';
                        } else {
                          final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
                          if (!validCharacters.hasMatch(value)) {
                            return 'Enter valid Password';
                          } else {
                            return null;
                          }
                        }
                        ;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 100, right: 20),
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              dbOperation(context);
                            }
                          },
                          child: Text('Login'),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 165),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => RegistrationScreen()));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void dbOperation(BuildContext ctx) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'student.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY , name TEXT, adm_no TEXT , phone TEXT , pwd TEXT , email TEXT)');
    });

    String admNumber = _admission_no.text.toString();
    String password = _pwd.text.toString();

    List<Map> list = await database.rawQuery(
        "SELECT * FROM dogs WHERE adm_no = '$admNumber' and pwd = '$password' ");

    int result = list.length;
    print(result);

    if (result == 1) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (contect) {
        return AllDetails();
      }));
    } else {
      return null;
    }

    await database.close();
  }
}
