import 'package:flutter/material.dart';
import 'package:students/Widgets/custom_elavated_button_widgets.dart';
import 'package:students/Widgets/custom_text_button_widgets.dart';
import 'package:students/Widgets/custom_textform_feild_widget.dart';
import 'package:students/Widgets/custom_sizedBox_widgets.dart';
import 'package:students/student/Screens/home_screen.dart';
import 'package:students/student/Screens/registration_screen.dart';
import 'package:students/student/database/database_helper.dart';
import 'package:students/student/model/student_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

//controllers
  TextEditingController admCntrl = TextEditingController();
  TextEditingController _passwordCntrl = TextEditingController();

  final formkey = GlobalKey<FormState>();
  DatabaseHelper db = DatabaseHelper();
  List<StudentModel> datas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  CustomSizedBox_Widgets(heights: 100.0),
                  CustomeTextFormFeildWidgets(
                    cntrl: admCntrl,
                    inputType: (TextInputType.text),
                    textVisibility: false,
                    borderRadius: 20,
                    labelTexts: 'Admission Number',
                    textColor: (Colors.black),
                    validateChecking: r'^[0-9]+$',
                    validateError: 'Admission Number is Required',
                  ),
                  CustomSizedBox_Widgets(heights: 20.0),
                  CustomeTextFormFeildWidgets(
                    cntrl: _passwordCntrl,
                    inputType: (TextInputType.text),
                    textVisibility: true,
                    borderRadius: 20,
                    labelTexts: 'Password ',
                    textColor: (Colors.black),
                    validateChecking: r'[a-zA-Z0-9]{6,}$',
                    validateError: 'Password is Required',
                  ),
                  CustomSizedBox_Widgets(heights: 20.0),
                  CustomeElavatedButtonWidgets(
                    texts: 'Login',
                    btnBackgroundColor: Colors.blue,
                    borderRadius: 20.0,
                    paddings: 30,
                    onpressed: () async {
                      if (formkey.currentState!.validate()) {
                        String admissionNumber = admCntrl.text.toString();
                        String Password = _passwordCntrl.text.toString();
                        datas = await db.check_log(admissionNumber, Password);
                        if (datas.length == 1) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        }
                      }
                    },
                  ),
                  CustomeTextButtonWidgets(
                    text: 'Regiatration',
                    fontSize: 18,
                    fontWeight: (FontWeight.bold),
                    textColor: (Colors.blue),
                    onpressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegistrationPage()));
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
