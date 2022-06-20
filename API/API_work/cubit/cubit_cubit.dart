import 'package:api_sample/API_work/API/commen_api.dart';
import 'package:api_sample/API_work/model/model.dart';
import 'package:bloc/bloc.dart';

part 'cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  CubitCubit() : super(CubitInitial());

  getDatas() => emit(CubitState(products: fetchProducts()));
  getEachDatas(String ids) => emit(CubitState(titleText: fetchProducts()));
}
