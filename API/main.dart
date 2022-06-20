import 'package:api_sample/api_using_cubit/Cubit/cubit_cubit.dart';
import 'package:api_sample/api_using_cubit/UI/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitCubit(),
      child: MaterialApp(
        title: 'API Integration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: APIHomePage(),
      ),
    );
  }
}
