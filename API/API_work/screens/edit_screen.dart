import 'package:api_sample/API_work/cubit/cubit_cubit.dart';
import 'package:api_sample/API_work/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScreen extends StatelessWidget {
  int id;
  EditScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CubitCubit>().getEachDatas('$id');
    return Scaffold(
      appBar: AppBar(title: Text('Edit Page')),
      body: Center(
        child: BlocBuilder<CubitCubit, CubitState>(
          builder: (context, state) {
            return FutureBuilder<List<Fruitss>>(
              future: state.titleText,
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? EdidData(items: snapshot.data!)
                    : Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
    );
  }
}

class EdidData extends StatelessWidget {
  final List<Fruitss> items;
  TextEditingController _titleCntrl = TextEditingController();
  TextEditingController _idCntrl = TextEditingController();
  EdidData({Key? key, required this.items});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleCntrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Title',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _idCntrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Id',
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Edit'))
          ],
        ),
      ),
    );
  }
}
