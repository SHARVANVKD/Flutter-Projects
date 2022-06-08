import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/helper/database_helper.dart';
import 'package:login/screens/homePage.dart';
import 'package:login/screens/signupPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/ModelClass.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginpageState();
}

class LoginpageState extends State {
  late DatabaseHelper db;
  List<ModelClass> datas = [];
  late SharedPreferences logindata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = DatabaseHelper();
    getLocal();
  }

  void getLocal() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      userController.text = logindata.getString('username')!;
      passController.text = logindata.getString('password')!;
    });
  }

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Center(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: userController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Username or Email",
                          hintText: "username or email",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10)),
                      validator: (username) {
                        if (isUsernameValidate(username!)) {
                          return null;
                        } else
                          return 'Enter a valid username';
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: passController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "password",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10)),
                    validator: (password) {
                      if (isPasswordValidate(password!)) {
                        return null;
                      } else
                        return "Entered password is too short";
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          String userName = userController.text.toString();
                          String Password = passController.text.toString();
                          datas = await db.check_log(userName, Password);
                          if (datas.isEmpty) {
                            print("error");
                          } else {
                            logindata.setString('username', userName);
                            logindata.setString('password', Password);
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage()));
                          }
                        }
                      },
                      child: Text(
                        "Login".toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a User?",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupPage()));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isUsernameValidate(String username) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(username) && username != null);
  }

  bool isPasswordValidate(String password) {
    String pattern = r'[a-zA-Z0-9]{6,}$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(password) && password != null);
  }
}
