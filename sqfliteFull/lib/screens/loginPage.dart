import 'package:flutter/material.dart';
import 'package:sharwan/db/database_helper.dart';
import 'package:sharwan/screens/registration.dart';
import 'package:sqflite/sqflite.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController adm_noCntrl = TextEditingController();
  TextEditingController pwdCntrl = TextEditingController();

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
                      controller: adm_noCntrl,
                      keyboardType: TextInputType.emailAddress,
                      //autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Admission Number",
                          hintText: "Admission Number",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10)),
                      validator: (username) {
                        if (isADMValidate(username!)) {
                          return null;
                        } else
                          return 'Enter a valid Admission Number';
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: pwdCntrl,
                    //autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          String adminsstionNumber =
                              adm_noCntrl.text.toString();
                          String Password = pwdCntrl.text.toString();

                          initilizeDatabase();
                          chcekLogin(adm_no: adminsstionNumber, pwd: Password);
                        }
                      },
                      child: Text(
                        "Login".toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
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
                                builder: (context) => Registration()));
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

  bool isADMValidate(String adm) {
    String pattern = r'^[0-9]+$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(adm) && adm != null);
  }

  bool isPasswordValidate(String password) {
    String pattern = r'[a-zA-Z0-9]{6,}$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(password) && password != null);
  }
}
