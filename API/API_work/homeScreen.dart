import 'package:api_sample/API_work/model/model.dart';
import 'package:api_sample/API_work/screens/all_datas.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Integration')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Insert')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllDatas()),
                    );
                  },
                  child: Text('Get All ')),
              ElevatedButton(onPressed: () {}, child: Text('Get Each ')),
            ],
          ),
        ),
      ),
    );
  }
}
