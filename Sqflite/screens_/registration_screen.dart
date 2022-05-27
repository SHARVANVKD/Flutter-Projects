import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_managment/model/student_model.dart';
import 'package:student_managment/screens_/loginScreen.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _admission_no = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: ListView(
        children: [
          SizedBox(
            height: 810,
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
                        'Registration Screen',
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
                            hintText: "Adminssion Number (Minimum 5 Letter)",
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
                        controller: _name,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Name",
                            fillColor: Colors.white70),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter valid name';
                          } else {
                            final validCharacters = RegExp(r'^[a-zA-Z]+$');
                            if (!validCharacters.hasMatch(value)) {
                              return 'Enter valid Name';
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
                          top: 10, bottom: 10, left: 20, right: 20),
                      child: TextFormField(
                        controller: _phone,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Phone Number",
                            fillColor: Colors.white70),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length != 10) {
                            return 'Enter valid Phone Number';
                          } else {
                            final validCharacters = RegExp(r'^[0-9]+$');
                            if (!validCharacters.hasMatch(value)) {
                              return 'Enter valid Phone Number';
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
                        controller: _email,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Email",
                            fillColor: Colors.white70),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter valid Email Number';
                          } else {
                            final validCharacters = RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                            if (!validCharacters.hasMatch(value)) {
                              return 'Enter valid Eamil Number';
                            } else {
                              return null;
                            }
                          }
                          ;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 100, right: 20),
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Successfully Regitered')),
                                );
                                dbOperation();
                              }
                            },
                            child: Text('Register'),
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
                                builder: (ctx) => LoginScreen()));
                          },
                          child: Text(
                            'Login',
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
        ],
      ),
    );
  }

  void dbOperation() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'student.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY , name TEXT, adm_no TEXT , phone TEXT , pwd TEXT , email TEXT)',
        );
      },
      version: 1,
    );

    Future<void> insertDog(Dog dog) async {
      // Get a reference to the database.
      final db = await database;
      await db.insert(
        'dogs',
        dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    String names = _name.text.toString();
    String adm_no = _admission_no.text.toString();
    String phone = _phone.text.toString();
    String pwd = _pwd.text.toString();
    String email = _email.text.toString();

    var fido =
        Dog(name: names, adm_no: adm_no, phone: phone, pwd: pwd, email: email);

    await insertDog(fido);

// checking purpose

    // Future<List<Dog>> dogs() async {
    //   final db = await database;
    //   final List<Map<String, dynamic>> maps = await db.query('dogs');

    //   // Convert the List<Map<String, dynamic> into a List<Dog>.
    //   return List.generate(maps.length, (i) {
    //     return Dog(
    //         name: maps[i]['name'],
    //         adm_no: maps[i]['adm_no'],
    //         phone: maps[i]['phone'],
    //         pwd: maps[i]['pwd'],
    //         email: maps[i]['email']);
    //   });
    // }    print(await dogs()); // Prints a list that include Fido.
  }
}
