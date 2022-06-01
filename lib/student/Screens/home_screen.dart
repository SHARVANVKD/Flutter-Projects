import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students/Widgets/custom_elavated_button_widgets.dart';
import 'package:students/Widgets/custom_text_button_widgets.dart';
import 'package:students/Widgets/custom_text_feild_widget.dart';
import 'package:students/Widgets/custom_textform_feild_widget.dart';
import 'package:students/student/cubit/cubit_cubit.dart';
import 'package:students/student/database/database_helper.dart';
import 'package:students/student/model/student_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<StudentCubit>().getDatas();
    return Scaffold(
      appBar: AppBar(title: Text('All Students')),

      // body: BlocBuilder<StudentCubit, StudentCubitState>(
      //   builder: (context, state) {
      //     return Text(state.datas.length.toString());
      //   },
      // ),
      body: BlocBuilder<StudentCubit, StudentCubitState>(
        builder: (context, state) {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 2,
            ),
            itemCount: state.datas.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextWidgets(
                      text_: state.datas[index].name,
                      fontSize: 20,
                      textColor: Colors.blue),
                  CustomTextWidgets(
                      text_: state.datas[index].adm_no,
                      fontSize: 20,
                      textColor: Colors.black),

                  CustomeElavatedButtonWidgets(
                    texts: 'Edit',
                    onpressed: () {},
                  ),
                  CustomeElavatedButtonWidgets(
                    texts: 'Delete',
                    onpressed: () {},
                  ),
                  //CustomTextWidgets(text_: datas[1].name),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
