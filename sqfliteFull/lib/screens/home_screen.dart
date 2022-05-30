import 'package:flutter/material.dart';
import 'package:sharwan/db/database_helper.dart';
import 'package:sharwan/model/student_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StudentModel> datas = [];

  @override
  void initState() {
    initilizeDatabase();
    datas = getAllDatas() as List<StudentModel>;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int listCount = datas.length;
    return Scaffold(
        appBar: AppBar(title: Text('All Details')),
        body: ListView.separated(
          itemCount: listCount,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(datas[index].name),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Delete'),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Edit'))
              ],
            );
          },
        ));
  }
}
