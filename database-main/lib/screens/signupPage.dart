import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/model/ModelClass.dart';
import 'package:login/helper/database_helper.dart';
import 'package:login/screens/loginPage.dart';

import '../helper/database_helper.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignuppageState();
}

class SignuppageState extends State {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController admController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late DatabaseHelper db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = DatabaseHelper();
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Center(
              child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Name",
                              hintText: "name",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10)),
                          validator: (name) {
                            if (isnameValidate(name!)) {
                              return null;
                            } else
                              return "*Required";
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "email",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10)),
                          validator: (email) {
                            if (isEmailValidate(email!)) {
                              return null;
                            } else
                              return "Invalid Email";
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.datetime,
                          controller: dobController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Date Of Birth",
                              hintText: "dd-mm-yyyy",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10)),
                          validator: (dob) {
                            if (isDOBValidate(dob!)) {
                              return null;
                            } else
                              return "Invalid DOB format";
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          controller: courseController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Course",
                              hintText: "course",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10)),
                          validator: (course) {
                            if (isCourseValidate(course!)) {
                              return null;
                            } else
                              return "*Required";
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          controller: admController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Admission No",
                              hintText: "admission no",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10)),
                          validator: (adm) {
                            if (isADMValidate(adm!)) {
                              return null;
                            } else
                              return "*Required";
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: mobileController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Mobile No",
                              hintText: "mobile no",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10)),
                          validator: (mob) {
                            if (isMobileValidate(mob!)) {
                              return null;
                            } else
                              return "Invalid Mobile no";
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: passController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Passsword",
                              hintText: "password",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10)),
                          validator: (password) {
                            if (isPasswordValidate(password!)) {
                              return null;
                            } else
                              return "Entered password is too short";
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              ModelClass localModel = ModelClass(
                                  name: nameController.text,
                                  email: emailController.text,
                                  dob: dobController.text,
                                  course: courseController.text,
                                  adm_no: admController.text,
                                  mob: mobileController.text,
                                  password: passController.text);
                              db.insertdata(localModel);
                              Navigator.of(context).pop(context);
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => LoginPage()));
                            }
                          },
                          child: Text(
                            "Sign Up".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                    ],
                  )),
            ),
          ),
        ),
      ),
    ));
  }

  bool isnameValidate(String s) {
    String pattern = r'^[a-zA-Z ]+([._]?[a-zA-Z ]+)+$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(s) && s != null);
  }

  bool isEmailValidate(String email) {
    String e_pattern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp nameReg = RegExp(e_pattern);
    return (nameReg.hasMatch(email) && email != null);
  }

  bool isDOBValidate(String dob) {
    String d_pattern =
        r"^(0[1-9]|[12][0-9]|3[01])[-/.](0[1-9]|1[012])[-/.](19|20)";
    RegExp nameReg = RegExp(d_pattern);
    return (nameReg.hasMatch(dob) && dob != null);
  }

  bool isCourseValidate(String course) {
    String pattern = r'^[a-zA-Z ]+([._]?[a-zA-Z ]+)*$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(course) && course != null);
  }

  bool isADMValidate(String adm) {
    String pattern = r'^[0-9]+$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(adm) && adm != null);
  }

  bool isMobileValidate(String mob) {
    String pattern = r'^[0-9]{10}$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(mob) && mob != null);
  }

  bool isPasswordValidate(String password) {
    String pattern = r'[a-zA-Z0-9]{6,}$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(password) && password != null);
  }
}
