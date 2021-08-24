part of 'calendar_bloc.dart';

@immutable
abstract class CalendarState {}

class AllContractState extends CalendarState {
  final List<ContractModel> allContract;

  AllContractState({required this.allContract});
}

class SetActiveDateState extends CalendarState with EquatableMixin {
  final String? activeDay;
  final int? weekNumber;
  final List<ContractModel> contract;
  final List<ContractModel>? allContract;
  final String? dateModel;

  SetActiveDateState(
      {this.dateModel,
      required this.contract,
      this.allContract,
      this.weekNumber,
      this.activeDay});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [this.activeDay, this.weekNumber, this.contract, this.dateModel];
}
