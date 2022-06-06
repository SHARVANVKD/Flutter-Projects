part of 'cubit.dart';

@immutable
class CubitState {
  double? allocationFrom;
  String? nameAllocationFrom;
  double? allocationTo;
  String? nameAllocationTo;
  int? value = 0;
  CubitState(
      {this.allocationFrom,
      this.nameAllocationFrom,
      this.value,
      this.allocationTo,
      this.nameAllocationTo});
}

class CubitInitial extends CubitState {
  CubitInitial()
      : super(
            allocationFrom: 1004288.75,
            nameAllocationFrom: 'Equity Cash + MTF',
            allocationTo: 404288.75,
            nameAllocationTo: 'Equity Cash ');
}
