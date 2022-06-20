import 'package:api_sample/api_using_cubit/Cubit/cubit_cubit.dart';
import 'package:api_sample/api_using_cubit/UI/API/api.dart';
import 'package:api_sample/api_using_cubit/UI/Models/model.dart';
import 'package:api_sample/api_using_cubit/UI/Screens/get_all_datas.dart';
import 'package:api_sample/api_using_cubit/Widgets/custom_button_widget.dart';
import 'package:api_sample/api_using_cubit/Widgets/custom_textFormFeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int resultUpdateCheck = 0;

class ApiCreateNew extends StatelessWidget {
  String? id;
  String? title;
  String? userIds;

  List<Model> list;
  int index;
  ApiCreateNew(
      {Key? key,
      this.id,
      this.title,
      this.userIds,
      required this.list,
      required this.index})
      : super(key: key);

  GlobalKey<FormState> _idFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _titleFormKey = GlobalKey<FormState>();
  TextEditingController _titleCntrl = TextEditingController();
  TextEditingController _userIdCntrl = TextEditingController();

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text('Create New One')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
            child: (id != null) ? EditPage(ctx) : CreatePage(ctx, list, index)),
      ),
    );
  }

  Column CreatePage(BuildContext ctx, List<Model>? list, int? index) {
    return Column(
      children: [
        Form(
          key: _titleFormKey,
          child: CustomTextFormFeildWidget(
            cntrl: _titleCntrl,
            validator: Validator.defaultValidator,
            labelText: 'Enter Title',
            defaultErrorMessage: 'Title Feild Require',
            onChange: (value) {
              if (_titleFormKey.currentState!.validate()) return;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Form(
          key: _idFormKey,
          child: CustomTextFormFeildWidget(
            cntrl: _userIdCntrl,
            validator: Validator.defaultValidator,
            keyboardType: TextInputType.number,
            labelText: 'Enter UserId',
            defaultErrorMessage: 'UserId Feild Require',
            onChange: (value) {
              if (_idFormKey.currentState!.validate()) return;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<CubitCubit, CubitState>(
          builder: (context, state) {
            return CustomButtonWidget(
              btnAction: () async {
                if (_titleFormKey.currentState!.validate() &&
                    _idFormKey.currentState!.validate()) {
                  int userid = int.parse(_userIdCntrl.text);
                  dynamic result = await context.read<CubitCubit>().createNew(
                      Model(
                        userid,
                        101,
                        _titleCntrl.text.toString(),
                      ),
                      ctx);
                  createCheck = 1;
                  if (result != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApiGetAllDatas(
                                modelCreate: Model(
                                  userid,
                                  101,
                                  _titleCntrl.text.toString(),
                                ),
                              )),
                    );
                  } else {
                    return null;
                  }
                }
              },
              btnText: 'Create New',
            );
          },
        )
      ],
    );
  }

  Column EditPage(
    BuildContext ctx,
  ) {
    _titleCntrl.text = title!;
    _userIdCntrl.text = userIds!;
    return Column(
      children: [
        Form(
          key: _titleFormKey,
          child: CustomTextFormFeildWidget(
            cntrl: _titleCntrl,
            validator: Validator.defaultValidator,
            labelText: 'Enter Title',
            defaultErrorMessage: 'Title Feild Require',
            onChange: (value) {
              if (_titleFormKey.currentState!.validate()) return;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Form(
          key: _idFormKey,
          child: CustomTextFormFeildWidget(
            cntrl: _userIdCntrl,
            keyboardType: TextInputType.number,
            labelText: 'Enter UserId',
            validator: Validator.defaultValidator,
            defaultErrorMessage: 'UserId Feild Require',
            onChange: (value) {
              if (_idFormKey.currentState!.validate()) return;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<CubitCubit, CubitState>(
          builder: (context, state) {
            return CustomButtonWidget(
              btnAction: () async {
                if (_titleFormKey.currentState!.validate() &&
                    _idFormKey.currentState!.validate()) {
                  int userid = int.parse(_userIdCntrl.text);
                  int ids = int.parse(id.toString());
                  Model models =
                      Model(userid, ids, _titleCntrl.text.toString());
                  list[index] = models;
                  dynamic res = await context.read<CubitCubit>().updateData(
                        models,
                        ctx,
                      );
                  updateCheck = 1;
                  // print(resultUpdateCheck);
                  if (res != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApiGetAllDatas(
                                lists: list,
                              )),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApiGetAllDatas()),
                    );
                  }
                }
              },
              btnText: 'Update',
            );
          },
        )
      ],
    );
  }
}
