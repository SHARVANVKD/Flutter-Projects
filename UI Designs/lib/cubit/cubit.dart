import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cubit_state.dart';

enum SomeStatus { owned, notOwned }

class CubitCubit extends Cubit<CubitState> {
  late double valueFrom;
  late String nameFrom;

  CubitCubit() : super(CubitInitial());

  void radioFromClick({values}) {
    switch (values) {
      case 1:
        {
          valueFrom = 1004288.75;
          nameFrom = 'Equity Cash';
        }
        break;

      case 2:
        {
          valueFrom = 10000;
          nameFrom = 'Equity Cash + MTF';
        }
        break;
      case 3:
        {
          valueFrom = 15000;
          nameFrom = 'Equity F&O';
        }
        break;
      case 4:
        {
          valueFrom = 0;
          nameFrom = 'Currency F&O';
        }
        break;
      case 5:
        {
          valueFrom = 10000;
          nameFrom = 'MCX F&O';
        }
        break;
      case 6:
        {
          valueFrom = 7900;
          nameFrom = 'NCDEX F&O';
        }
        break;
    }
    emit(CubitState(
        allocationFrom: valueFrom,
        nameAllocationFrom: nameFrom,
        nameAllocationTo: state.nameAllocationTo.toString(),
        allocationTo: state.allocationTo));
  }

  void radioToClick({values}) {
    late String nameTo;
    switch (values) {
      case 1:
        {
          nameTo = 'Equity Cash';
        }
        break;

      case 2:
        {
          nameTo = 'Equity Cash + MTF';
        }
        break;
      case 3:
        {
          nameTo = 'Equity F&O';
        }
        break;
      case 4:
        {
          nameTo = 'Currency F&O';
        }
        break;
      case 5:
        {
          nameTo = 'MCX F&O';
        }
        break;
      case 6:
        {
          nameTo = 'NCDEX F&O';
        }
        break;
    }

    emit(CubitState(
        nameAllocationTo: nameTo,
        nameAllocationFrom: nameFrom,
        allocationFrom: valueFrom,
        allocationTo: state.allocationTo));
    //print(nameTo);
    //Navigator.of(context).pop();
  }
}
