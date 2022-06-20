part of 'cubit_cubit.dart';

class CubitState {
  Future<List<Model>>? products;

  CubitState({this.products});
}

class CubitInitial extends CubitState {
  CubitInitial() : super(products: Future.value([]));
}
