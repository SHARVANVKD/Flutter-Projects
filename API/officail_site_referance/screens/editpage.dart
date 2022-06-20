import 'package:api_sample/officail_site_referance/API/services.dart';
import 'package:api_sample/officail_site_referance/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditPage extends StatelessWidget {
  int index;
  EditPage({Key? key, required this.index}) : super(key: key);
  TextEditingController _userIdCntrl = TextEditingController();
  TextEditingController _titleCntrl = TextEditingController();
  late List<Fruits> lists;
  @override
  Widget build(BuildContext context) {
    lists = getEditableData(index);
    setText();
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: _userIdCntrl,
              decoration: InputDecoration(labelText: 'User Id'),
            ),
            TextField(
              controller: _titleCntrl,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            ElevatedButton(
                onPressed: () {
                  String ids = lists[index].id.toString();
                  String titles = _titleCntrl.text.toString();
                  String userId = _userIdCntrl.text.toString();

                  updateAllDatas(
                      id: ids, title: titles, userId: userId, context: context);
                },
                child: Text('Edit'))
          ],
        ),
      ),
    );
  }

  setText() {
    _userIdCntrl.text = lists[index].id.toString();
    _titleCntrl.text = lists[index].title.toString();
  }
}
