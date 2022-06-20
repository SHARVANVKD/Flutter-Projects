import 'package:api_sample/officail_site_referance/API/services.dart';
import 'package:api_sample/officail_site_referance/model/model.dart';
import 'package:api_sample/officail_site_referance/screens/editpage.dart';
import 'package:api_sample/officail_site_referance/screens/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyHomeOfficial extends StatefulWidget {
  @override
  State<MyHomeOfficial> createState() => _MyHomeOfficial();
}

class _MyHomeOfficial extends State<MyHomeOfficial> {
  // late Future<List<Fruits>> products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = getAllDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API Integration"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostPage()));
              },
              child: const Text('Create Data'),
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder<List<Fruits>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? FruitList(items: snapshot.data!)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}

class FruitList extends StatelessWidget {
  final List<Fruits> items;

  FruitList({Key? key, required this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.all(2),
            child: Card(
              elevation: 2,
              child: ListTile(
                  title: Text(
                    items[index].title!,
                  ),
                  subtitle: Text(items[index].id.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditPage(
                                        index: index,
                                      )));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteData(id: items[index].id.toString());
                        },
                      ),
                    ],
                  )),
            ));
      },
    );
  }
}
