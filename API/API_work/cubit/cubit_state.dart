part of 'cubit_cubit.dart';

class CubitState {
  Future<List<Fruitss>>? products;
  Future<List<Fruitss>>? titleText;
  CubitState({this.products, this.titleText});
}

class CubitInitial extends CubitState {
  // CounterInitial() : super(counterValue: 0);
  CubitInitial() : super(products: Future.value([]));
}
