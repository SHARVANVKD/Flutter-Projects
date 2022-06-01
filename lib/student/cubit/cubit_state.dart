part of 'cubit_cubit.dart';

class StudentCubitState {
  List<StudentModel> datas;
  StudentCubitState({required this.datas});
}

class readAllData extends StudentCubitState {
  readAllData() : super(datas: []);
}
