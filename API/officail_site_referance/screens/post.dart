import 'package:api_sample/officail_site_referance/API/services.dart';
import 'package:api_sample/officail_site_referance/model/model.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  PostPage({
    Key? key,
  }) : super(key: key);
  TextEditingController _userIdCntrl = TextEditingController();
  TextEditingController _titleCntrl = TextEditingController();
  late List<Fruits> lists;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
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
              decoration: InputDecoration(labelText: 'Title '),
            ),
            ElevatedButton(
                onPressed: () {
                  newPost(
                      title: _titleCntrl.text.toString(),
                      userId: _userIdCntrl.text.toString(),
                      context: context);
                },
                child: Text('Create'))
          ],
        ),
      ),
    );
  }
}
