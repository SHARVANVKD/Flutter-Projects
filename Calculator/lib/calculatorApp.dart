import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  CalculatorApp({Key? key}) : super(key: key);
  final TextEditingController textField = TextEditingController();
  double valueOne = 0, valueTwo = 0;
  bool mAddition = false,
      mSubtract = false,
      mMultiplication = false,
      mDivision = false;
  // bool mAddition, mSubtract, mMultiplication, mDivision;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Calculator")),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 100),
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.all(30),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: textField,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          textField.text = '';
                          mAddition = false;
                          mSubtract = false;
                          mMultiplication = false;
                          mDivision = false;
                          valueOne = 0;
                          valueTwo = 0;
                        },
                        child: const Text(
                          "C",
                          style: TextStyle(fontSize: 40),
                        )),
                    TextButton(
                        onPressed: () {
                          valueTwo = double.parse(textField.text);
                          if (mAddition == true) {
                            textField.text = (valueOne + valueTwo).toString();
                            mAddition = false;
                          }
                          if (mSubtract == true) {
                            textField.text = (valueOne - valueTwo).toString();
                            mSubtract = false;
                          }
                          if (mMultiplication == true) {
                            textField.text = (valueOne * valueTwo).toString();
                            mAddition = false;
                          }
                          if (mDivision == true) {
                            textField.text = (valueOne / valueTwo).toString();
                            mAddition = false;
                          }
                        },
                        child: const Text(
                          "=",
                          style: TextStyle(fontSize: 40),
                        )),
                    roundNumberButtonShape("0"),
                    roundActionButtonShape("/"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  roundNumberButtonShape("7"),
                  roundNumberButtonShape("8"),
                  roundNumberButtonShape("9"),
                  roundActionButtonShape("+"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  roundNumberButtonShape("4"),
                  roundNumberButtonShape("5"),
                  roundNumberButtonShape("6"),
                  roundActionButtonShape("-"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  roundNumberButtonShape("1"),
                  roundNumberButtonShape("2"),
                  roundNumberButtonShape("3"),
                  roundActionButtonShape("*"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  roundActionButtonShape(String action) {
    return OutlinedButton(
      onPressed: () {
        valueOne = double.parse(textField.text);
        textField.clear();
        if (action == '+') {
          mAddition = true;
        }
        if (action == '-') {
          mSubtract = true;
        }
        if (action == '*') {
          mMultiplication = true;
        }
        if (action == '/') {
          mDivision = true;
        }
      },
      child: Text(
        action,
        style: const TextStyle(fontSize: 40),
      ),
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
      ),
    );
  }

  roundNumberButtonShape(String number) {
    return OutlinedButton(
      onPressed: () {
        textField.text = (textField.text) + number;
      },
      child: Text(
        number,
        style: const TextStyle(fontSize: 40),
      ),
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
