import 'package:api_sample/officail_site_referance/API/api.dart';
import 'package:api_sample/officail_site_referance/model/model.dart';
import 'package:flutter/cupertino.dart';

late Future<List<Fruits>> products;
late List<Fruits> list;

Future<List<Fruits>> getAllDatas() async {
  list = await fetchProducts();
  return products = fetchProducts();
}

getEditableData(int id) {
  return list;
}

updateAllDatas(
    {String? id,
    String? title,
    String? userId,
    required BuildContext context}) {
  updateAlbum(id: id, title: title, userId: userId);
  Navigator.pop(context);
}

newPost(
    {String? id,
    String? title,
    String? userId,
    required BuildContext context}) {
  createAlbum(id: id, title: title, userId: userId);
  Navigator.pop(context);
}

deleteData({required String id}) {
  deleteAlbum(id: id);
}

List getEachData({required String id}) {
  int ids = id as int;
  String title = list[ids].title.toString();
  String userId = list[ids].UserId.toString();
  List lists = <String>[title, userId];
  return lists;
}
