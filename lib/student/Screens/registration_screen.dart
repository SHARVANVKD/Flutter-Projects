import 'package:flutter/material.dart';
import 'package:students/Widgets/custom_elavated_button_widgets.dart';
import 'package:students/Widgets/custom_sizedBox_widgets.dart';
import 'package:students/Widgets/custom_text_button_widgets.dart';
import 'package:students/Widgets/custom_textform_feild_widget.dart';
import 'package:students/student/Screens/home_screen.dart';

import 'package:students/student/Screens/login_screen.dart';
import 'package:students/student/database/database_helper.dart';
import 'package:students/student/model/student_model.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  //form key
  final formkey = GlobalKey<FormState>();
  DatabaseHelper db = DatabaseHelper();

//controllers
  TextEditingController nameCntrl = TextEditingController();
  TextEditingController _passwordCntrl = TextEditingController();
  TextEditingController phoneCntrl = TextEditingController();
  TextEditingController admissionNoCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resiteration')),
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
                    cntrl: nameCntrl,
                    autoInteraction: (AutovalidateMode.onUserInteraction),
                    textVisibility: false,
                    inputType: (TextInputType.text),
                    borderRadius: 20,
                    labelTexts: 'Name',
                    textColor: (Colors.black),
                    validateChecking: r'^[a-zA-Z ]+([._]?[a-zA-Z ]+)+$',
                    validateError: 'Name is Required',
                  ),
                  CustomSizedBox_Widgets(heights: 20.0),
                  CustomeTextFormFeildWidgets(
                    cntrl: _passwordCntrl,
                    autoInteraction: (AutovalidateMode.onUserInteraction),
                    textVisibility: true,
                    inputType: (TextInputType.text),
                    borderRadius: 20,
                    labelTexts: 'Password ',
                    textColor: (Colors.black),
                    validateChecking: r'[a-zA-Z0-9]{6,}$',
                    validateError: 'Password is Required',
                  ),
                  CustomSizedBox_Widgets(heights: 20.0),
                  CustomeTextFormFeildWidgets(
                    cntrl: phoneCntrl,
                    autoInteraction: (AutovalidateMode.onUserInteraction),
                    inputType: (TextInputType.number),
                    textVisibility: false,
                    borderRadius: 20,
                    labelTexts: 'Phone Number',
                    textColor: (Colors.black),
                    validateChecking: r'^[0-9]{10}$',
                    validateError: 'Phone is Required',
                  ),
                  CustomSizedBox_Widgets(heights: 20.0),
                  CustomeTextFormFeildWidgets(
                    cntrl: admissionNoCntrl,
                    autoInteraction: (AutovalidateMode.onUserInteraction),
                    textVisibility: false,
                    inputType: (TextInputType.number),
                    borderRadius: 20,
                    labelTexts: 'Admission Number',
                    textColor: (Colors.black),
                    validateChecking: r'^[0-9]+$',
                    validateError: 'Admission Number is Required',
                  ),
                  CustomSizedBox_Widgets(heights: 20.0),
                  CustomeElavatedButtonWidgets(
                    texts: 'Register',
                    btnBackgroundColor: Colors.blue,
                    borderRadius: 20.0,
                    paddings: 30,
                    onpressed: () {
                      if (formkey.currentState!.validate()) {
                        StudentModel model = StudentModel(
                            name: nameCntrl.text,
                            adm_no: admissionNoCntrl.text,
                            phone: phoneCntrl.text,
                            password: _passwordCntrl.text);
                        db.insertdata(model);
                        Navigator.of(context).pop(context);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => HomeScreen()));
                      }
                    },
                  ),
                  CustomeTextButtonWidgets(
                    text: 'Login',
                    fontSize: 18,
                    fontWeight: (FontWeight.bold),
                    textColor: (Colors.blue),
                    onpressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
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
