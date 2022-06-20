import 'package:api_sample/officail_site_referance/API/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GetEachDatas extends StatelessWidget {
  GetEachDatas({Key? key}) : super(key: key);
  TextEditingController _idCntrl = TextEditingController();
  late List datas;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get Each Datas')),
      body: Column(
        children: [
          TextField(
            controller: _idCntrl,
            decoration: InputDecoration(labelText: 'User Id'),
          ),
          ElevatedButton(
              onPressed: () {
                String id = _idCntrl.text.toString();
                datas = getEachData(id: id);
                visible = true;
              },
              child: Text('Search')),
          SizedBox(
            height: 50,
          ),
          Visibility(
              visible: visible,
              child: ListTile(
                title: Text('asd'),
                subtitle: Text('asd'),
              ))
        ],
      ),
    );
  }
}
