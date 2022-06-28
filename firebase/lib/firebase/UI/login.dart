import 'package:firebase_logins_/firebase/UI/Registration.dart';
import 'package:firebase_logins_/firebase/Widgets/custom_elevated_button.dart';
import 'package:firebase_logins_/firebase/Widgets/custom_sized_box.dart';
import 'package:firebase_logins_/firebase/Widgets/custom_textformfeild.dart';
import 'package:firebase_logins_/firebase/service/firebase_core.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  TextEditingController emailCntrl = TextEditingController();
  TextEditingController pwdCntrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication'),
      ),
      body: FutureBuilder(
        future: FirebaseCore.initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          CustomSizedBox(height: 10),
                          CustomTextFeilds(
                            cntrl: emailCntrl,
                            hintText: 'Email',
                            errorText: 'Enter Valid Email',
                          ),
                          CustomSizedBox(height: 10),
                          CustomTextFeilds(
                            cntrl: pwdCntrl,
                            hintText: 'Password',
                            errorText: 'Enter Valid Password',
                            obscureText: true,
                          ),
                          CustomSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomElevatedButton(
                                  onpressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      FirebaseCore.signInUsingEmailPassword(
                                          email: emailCntrl.text.toString(),
                                          password: pwdCntrl.text.toString(),
                                          context: context);
                                    }
                                  },
                                  child: const Text('Login')),
                              CustomElevatedButton(
                                onpressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterationPage(),
                                  ));
                                },
                                child: const Text('Register'),
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
