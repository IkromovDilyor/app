part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent {}
class CalendarDecrementEvent extends CalendarEvent{}
class CalendarIncrementEvent extends CalendarEvent{}
class GenerateListEvent extends CalendarEvent{}
class CalendarInitialEvent extends CalendarEvent{}
class AllContractEvent extends CalendarEvent{}
class SetActiveDateEvent extends CalendarEvent with EquatableMixin{
  final String activeDay;
  SetActiveDateEvent({required this.activeDay});

  @override
  List<Object?> get props => [this.activeDay];
}
class AddContractEvent extends CalendarEvent with EquatableMixin{
  final String? date;
  final String? name;
  final String? status;
  AddContractEvent({ this.date,  this.name,   this.status});

  @override
  List<Object?> get props => [this.date,this.name,this.status];
}