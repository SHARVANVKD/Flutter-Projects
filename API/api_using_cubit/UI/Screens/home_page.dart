import 'package:api_sample/api_using_cubit/UI/Screens/create_new_data.dart';
import 'package:api_sample/api_using_cubit/UI/Screens/get_all_datas.dart';
import 'package:flutter/material.dart';

class APIHomePage extends StatelessWidget {
  const APIHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
            child: Column(
          children: [
            // Center(
            //   child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => ApiGetAllDatas()),
            //         );
            //       },
            //       child: Text('Get All Titles')),
            // ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApiGetAllDatas()),
                    );
                  },
                  child: Text('Get All Datas')),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApiCreateNew(
                                list: [],
                                index: 0,
                              )),
                    );
                  },
                  child: Text('Create New One')),
            ),
          ],
        )),
      ),
    );
  }
}
