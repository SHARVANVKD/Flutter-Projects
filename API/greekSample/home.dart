import 'package:api_sample/greekSample/api.dart';
import 'package:api_sample/greekSample/model.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late Future<List<Fruit>> products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API Integration"),
        ),
        body: Center(
          child: FutureBuilder<List<Fruit>>(
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
  final List<Fruit> items;

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
                title: Center(
                  child: Text(
                    this.items[index].courseMode,
                  ),
                ),
                subtitle: Image.network(this.items[index].courseImage),
              ),
            ));
      },
    );
  }
}
