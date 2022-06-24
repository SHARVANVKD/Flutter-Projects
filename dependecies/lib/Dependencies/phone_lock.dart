import 'package:flutter/material.dart';
import 'package:pattern_lock/pattern_lock.dart';

class PhoneLockes extends StatefulWidget {
  const PhoneLockes({Key? key}) : super(key: key);

  @override
  State<PhoneLockes> createState() => _PhoneLockesState();
}

class _PhoneLockesState extends State<PhoneLockes> {
  List<int> lock = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Lock '),
      ),
      body: settingLock(),
    );
  }

  Widget settingLock() {
    if (lock.length != 0) {
      return PatternLock(
        // color of selected points.
        selectedColor: Colors.red,
        // radius of points.
        pointRadius: 10,
        // whether show user's input and highlight selected points.
        showInput: true,
        // count of points horizontally and vertically.
        dimension: 3,
        // padding of points area relative to distance between points.
        relativePadding: 0.7,
        // needed distance from input to point to select point.
        selectThreshold: 25,
        // whether fill points.
        fillPoints: true,
        // callback that called when user's input complete. Called if user selected one or more points.
        onInputComplete: (List<int> checkLock) {
          if (checkLock == lock) {
            print('success');
          } else {
            print('fail');
          }
          // print("pattern is ($checkLock)");
        },
      );
    }
    return PatternLock(
      // color of selected points.
      selectedColor: Colors.red,
      // radius of points.
      pointRadius: 10,
      // whether show user's input and highlight selected points.
      showInput: true,
      // count of points horizontally and vertically.
      dimension: 3,
      // padding of points area relative to distance between points.
      relativePadding: 0.7,
      // needed distance from input to point to select point.
      selectThreshold: 25,
      // whether fill points.
      fillPoints: true,
      // callback that called when user's input complete. Called if user selected one or more points.
      onInputComplete: (List<int> input) {
        print('set');
        print("pattern is ($input)");
      },
    );
  }
}
