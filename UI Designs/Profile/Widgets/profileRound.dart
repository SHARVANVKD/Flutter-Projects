import 'package:flutter/material.dart';

import '../assets.dart';
class ProfileRound1 extends StatelessWidget {
  const ProfileRound1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 210,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              mummuka,
              width: 150,
              height: 150,
            ),
          ),
          Text(
            'Alice James',
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
