import 'package:api_sample/api_using_cubit/Cubit/cubit_cubit.dart';
import 'package:api_sample/api_using_cubit/UI/Models/model.dart';
import 'package:api_sample/api_using_cubit/Widgets/custom_textButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> CustomAlertDialoge(
    BuildContext context, String id, Future<List<Model>> list) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete ..!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Confromation for Delete'),
            ],
          ),
        ),
        actions: <Widget>[
          CustomTextButtonWidget(
              btnAction: () {
                Navigator.of(context).pop();
              },
              textBtn: 'Cancel'),
          CustomTextButtonWidget(
              btnAction: () async {
                dynamic res = await context
                    .read<CubitCubit>()
                    .deleteData(id, context, list);
                await Future.delayed(Duration(seconds: 2));
                Navigator.of(context).pop();
              },
              textBtn: 'Delete')
        ],
      );
    },
  );
}
