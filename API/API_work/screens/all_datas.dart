import 'package:api_sample/API_work/cubit/cubit_cubit.dart';
import 'package:api_sample/API_work/model/model.dart';
import 'package:api_sample/API_work/screens/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllDatas extends StatelessWidget {
  AllDatas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CubitCubit>().getDatas();
    return Scaffold(
        appBar: AppBar(title: Text('All Datas')),
        body: Center(
          child: BlocBuilder<CubitCubit, CubitState>(
            builder: (context, state) {
              return FutureBuilder<List<Fruitss>>(
                future: state.products,
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? FruitList(items: snapshot.data!)
                      : Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        ));
  }
}

class FruitList extends StatelessWidget {
  final List<Fruitss> items;

  FruitList({Key? key, required this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemCount: items.length,
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
                              builder: (context) =>
                                  EditScreen(id: items[index].id!),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ],
                  )),
            ));
      },
    );
  }
}
