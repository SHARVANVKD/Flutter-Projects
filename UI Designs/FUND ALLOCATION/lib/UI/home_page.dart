import 'package:flutter/material.dart';
import 'package:fund_allocations/UI/custom_appbar_sction.dart';
import 'package:fund_allocations/UI/custom_tabbar_section.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          CustomAppbarSection(),
          CustomTababrSection(),
        ]),
      ),
    );
  }
}
