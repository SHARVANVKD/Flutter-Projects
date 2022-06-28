import 'package:firebase_logins_/firebase/UI/login.dart';
import 'package:firebase_logins_/firebase/Widgets/custom_elevated_button.dart';
import 'package:firebase_logins_/firebase/Widgets/custom_sized_box.dart';
import 'package:firebase_logins_/firebase/Widgets/custom_textformfeild.dart';
import 'package:firebase_logins_/firebase/service/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterationPage extends StatelessWidget {
  TextEditingController nameCntrl = TextEditingController();
  TextEditingController emailCntrl = TextEditingController();
  TextEditingController pwdCntrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  RegisterationPage({Key? key}) : super(key: key);

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
                            'Registration',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          CustomSizedBox(height: 10),
                          CustomSizedBox(
                            height: 60,
                            child: CustomTextFeilds(
                              cntrl: nameCntrl,
                              hintText: 'Name',
                              errorText: 'Enter Valid Name',
                            ),
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
                                      FirebaseCore.registerUsingEmailPassword(
                                          email: emailCntrl.text.toString(),
                                          name: nameCntrl.text.toString(),
                                          password: pwdCntrl.text.toString(),
                                          ctx: context);
                                    }
                                  },
                                  child: const Text('Register')),
                              CustomElevatedButton(
                                onpressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                                },
                                child: const Text('Login'),
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
