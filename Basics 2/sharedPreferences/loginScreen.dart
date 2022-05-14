import 'package:basics2/sharedPreferences/homeScreen.dart';
import 'package:basics2/sharedPreferences/widgets/textFeilds.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



const SAVE_KEY_NAME = 'UserLogedIn';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userName = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFeild(labelText: 'Username', controller: _userName),
              TextFeild(labelText: 'Password', controller: _password),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ElevatedButton.icon(
                      onPressed: () {
                        checkLogin(context);
                      },
                      icon: Icon(Icons.home),
                      label: Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void checkLogin(BuildContext ctx) async {
    final _Uname = _userName.text;
    final _Pwd = _password.text;

    if (_Uname != null  &&_Pwd != null) {
      final _sharedPreferance = await SharedPreferences.getInstance();
      await _sharedPreferance.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => HomeScreen()));
    } else {
      final _errorMessage = " Please Fill Username and Password ";

      //SnackBar
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(_errorMessage),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}
