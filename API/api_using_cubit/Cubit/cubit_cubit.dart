import 'package:api_sample/api_using_cubit/UI/API/services.dart';
import 'package:api_sample/api_using_cubit/UI/Models/model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  CubitCubit() : super(CubitInitial());

  getDatas(BuildContext ctx) =>
      emit(CubitState(products: getAllDatasservice(ctx)));
  dynamic createNew(Model model, BuildContext context) async {
    dynamic res = await newPostService(model, context);
    return res;
  }

  dynamic deleteData(
      String id, BuildContext context, Future<List<Model>> list) async {
    dynamic res = await deleteDataService(id: id, context: context);
    if (res != null) {
      emit(CubitState(products: list));
    } else {
      return null;
    }
  }

  dynamic updateData(Model model, BuildContext context) async {
    dynamic result = await updateDataService(model: model, context: context);
    return result;
  }
}
