import 'package:api_sample/api_using_cubit/UI/API/api.dart';
import 'package:api_sample/api_using_cubit/UI/Models/model.dart';
import 'package:flutter/cupertino.dart';

Future<List<Model>> getAllDatasservice(BuildContext context) async {
  late Future<List<Model>> products;
  products = fetchProducts(context);
  return products;
}

dynamic newPostService(Model model, BuildContext context) async {
  dynamic result = await createAlbum(model, context);
  return result;
}

dynamic deleteDataService(
    {required String id, required BuildContext context}) async {
  dynamic result = await deleteAlbum(id: id, ctx: context);
  return result;
}

dynamic updateDataService(
    {required Model model, required BuildContext context}) async {
  dynamic res = await updateAlbum(ctx: context, model: model);
  return res;
}
