import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:students/student/database/database_helper.dart';
import 'package:students/student/model/student_model.dart';

part 'cubit_state.dart';

class StudentCubit extends Cubit<StudentCubitState> {
  DatabaseHelper db = DatabaseHelper();
  StudentCubit() : super(readAllData());

  Future<void> getDatas() async =>
      emit(StudentCubitState(datas: await db.getData()));
}
