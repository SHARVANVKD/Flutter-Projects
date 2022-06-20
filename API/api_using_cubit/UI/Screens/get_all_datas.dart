import 'package:api_sample/api_using_cubit/Cubit/cubit_cubit.dart';
import 'package:api_sample/api_using_cubit/UI/Models/model.dart';
import 'package:api_sample/api_using_cubit/UI/Screens/create_new_data.dart';
import 'package:api_sample/api_using_cubit/Widgets/custom_alert_dailogu.dart';
import 'package:api_sample/api_using_cubit/Widgets/custom_iconButton_widget.dart';
import 'package:api_sample/api_using_cubit/Widgets/custom_listTile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int? createCheck;
int? updateCheck;

class ApiGetAllDatas extends StatelessWidget {
  Model? modelCreate;
  int? index;
  List<Model>? lists;
  ApiGetAllDatas({Key? key, this.modelCreate, this.index, this.lists})
      : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    ctx.read<CubitCubit>().getDatas(ctx);

    return Scaffold(
      appBar: AppBar(
        title: Text('All Datas'),
      ),
      body: Center(
        child: BlocBuilder<CubitCubit, CubitState>(
          builder: (context, state) {
            return FutureBuilder<List<Model>>(
              future: state.products,
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? FruitList(
                        items: snapshot.data!,
                        modelCreate: modelCreate,
                        createdChecked: createCheck,
                        updateChecked: updateCheck,
                        listss: lists,
                      )
                    : Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
    );
  }
}

class FruitList extends StatelessWidget {
  FruitList(
      {Key? key,
      required this.items,
      this.modelCreate,
      this.createdChecked,
      this.updateChecked,
      this.listss})
      : super(key: key);
  List<Model> items;
  Model? modelCreate;
  List<Model>? listss;
  int? createdChecked;
  int? updateChecked;
  @override
  Widget build(BuildContext context) {
    (createCheck == 1) ? items.add(modelCreate!) : items;
    createCheck = 2;
    if (updateChecked == 1) {
      items = listss ?? items;
    }
    return ListView.separated(
        itemBuilder: (context, index) => CustomListTileWidget(
              title: Text(
                items[index].title.toString(),
              ),
              subTitle: Text(
                items[index].id.toString(),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomIconButtonWidget(
                      icon: (Icon(Icons.edit)),
                      iconAction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApiCreateNew(
                                    id: items[index].id.toString(),
                                    title: items[index].title.toString(),
                                    userIds: items[index].UserId.toString(),
                                    index: index,
                                    list: items,
                                  )),
                        );
                      }),
                  SizedBox(
                    width: 30,
                  ),
                  CustomIconButtonWidget(
                      icon: (Icon(Icons.delete)),
                      iconAction: () {
                        _showMyDialog(context, items[index].id.toString(),
                            Future.value(items));
                        items.removeAt(index);
                      }),
                ],
              ),
            ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: items.length);
  }

  Future<void> _showMyDialog(
      BuildContext context, String id, Future<List<Model>> list) async {
    return CustomAlertDialoge(context, id, list);
  }
}
