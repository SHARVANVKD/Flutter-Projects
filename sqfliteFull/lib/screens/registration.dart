import 'package:flutter/material.dart';
import 'package:sharwan/db/database_helper.dart';
import 'package:sharwan/model/student_model.dart';
import 'package:sharwan/screens/home_screen.dart';
import 'package:sharwan/screens/loginPage.dart';

class Registration extends StatelessWidget {
  Registration({Key? key}) : super(key: key);

  TextEditingController _nameCntrl = TextEditingController();
  TextEditingController _emailCntrl = TextEditingController();
  TextEditingController _phoneCntrl = TextEditingController();
  TextEditingController _pwdCntrl = TextEditingController();
  TextEditingController _adm_no_Cntrl = TextEditingController();

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
                          controller: _nameCntrl,
                          //autovalidateMode: AutovalidateMode.,
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
                          controller: _emailCntrl,
                          keyboardType: TextInputType.emailAddress,
                          //autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          controller: _adm_no_Cntrl,
                          //autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
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
                          controller: _phoneCntrl,
                          keyboardType: TextInputType.phone,
                          //autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          obscureText: true,
                          controller: _pwdCntrl,
                          //autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              initilizeDatabase();
                              insertStudents(StudentModel(
                                  name: _nameCntrl.text.toString(),
                                  email: _emailCntrl.text.toString(),
                                  adm_number: _adm_no_Cntrl.text.toString(),
                                  phone: _phoneCntrl.text.toString(),
                                  password: _pwdCntrl.text.toString()));
                              getAllDatas();

                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                            }
                          },
                          child: Text(
                            "Sign Up".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
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
