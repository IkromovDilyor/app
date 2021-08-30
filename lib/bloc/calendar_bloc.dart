import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ibilling/model/model.dart';
import 'package:ibilling/model/mycolors.dart';
import 'package:jiffy/jiffy.dart';
import 'package:meta/meta.dart';
import 'package:ibilling/model/lists_date.dart';

part 'calendar_event.dart';

part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  var weekNumber = 0;
  var activeDate = Jiffy().format('dd.MM.yyyy').toString();
  List<ContractModel> sortedContract = [];
  List<ContractModel> blocContract = [];
  List<ContractModel> allContractList = [];
  List<ContractModel> historyContract = [];
  final List<String> randomDateList = [];

  CalendarBloc()
      : super(
          SetActiveDateState(
              activeDay: Jiffy().format('dd.MM.yyyy'),
              dateModel: Jiffy().format('dd.MM.yyyy'),
              weekNumber: 0,
              contract: []),
        ) {
    createContractList();
    add(CalendarInitialEvent());
  }

  @override
  Stream<CalendarState> mapEventToState(
    CalendarEvent event,
  ) async* {
    if (event is CalendarIncrementEvent) {
      this.weekNumber++;
      yield SetActiveDateState(
          contract: sortedContract,
          weekNumber: weekNumber,
          activeDay: activeDate);
    } else if (event is CalendarDecrementEvent) {
      this.weekNumber--;
      yield SetActiveDateState(
        activeDay: activeDate,
        contract: sortedContract,
        weekNumber: weekNumber,
      );
    } else if (event is SetActiveDateEvent) {
      activeDate = event.activeDay;
      sortContract(activeDate);
      List<ContractModel> newSortedList = List.from(sortedContract);
      yield SetActiveDateState(
          dateModel: Jiffy().format('dd.MM.yyyy').toString(),
          contract: newSortedList,
          weekNumber: weekNumber,
          activeDay: activeDate);
    } else if (event is SetActiveDateEvent) {
      activeDate = event.activeDay;
      sortContract(activeDate);
      List<ContractModel> newSortedList = List.from(sortedContract);
      yield SetActiveDateState(contract: newSortedList);
    } else if (event is AddContractEvent) {
      activeDate = event.date.toString();
      var random = Random();
      var randomInvoiceNumber = random.nextInt(2);
      var randomAmount = (random.nextInt(1) + 1) * 100000;
      var randomLastInvoiceNumber = random.nextInt(2);
      var randomNumberOfInvoice = random.nextInt(2);
      var invoiceStatusTextColor;
      var invoiceStatusBoxColor;
      switch (event.status) {
        case 'Paid':
          invoiceStatusBoxColor = MyColors.tealWithOpacity;
          invoiceStatusTextColor = MyColors.teal;
          break;
        case 'Invoice':
          invoiceStatusBoxColor = MyColors.yellowWithOpacity;
          invoiceStatusTextColor = MyColors.yellow;
          break;
        case 'Rejected by Payme':
          invoiceStatusBoxColor = MyColors.pinkWithOpacity;
          invoiceStatusTextColor = MyColors.pink;
          break;
        case 'Rejected by IQ':
          invoiceStatusBoxColor = MyColors.pinkWithOpacity;
          invoiceStatusTextColor = MyColors.pink;
          break;
        case "in Process":
          invoiceStatusBoxColor = MyColors.yellowWithOpacity;
          invoiceStatusTextColor = MyColors.yellow;
          break;
      }
      blocContract.add(ContractModel(
        date: event.date.toString(),
        name: event.name.toString(),
        invoiceNumber: randomInvoiceNumber,
        amount: randomAmount,
        numberOfInvoice: randomNumberOfInvoice,
        status: event.status.toString(),
        lastInvoiceNum: randomLastInvoiceNumber,
        invoiceStatusTextColor: invoiceStatusTextColor,
        invoiceStatusBoxColor: invoiceStatusBoxColor,
      ));
      sortContract(activeDate);
      List<ContractModel> newSortedList = List.from(sortedContract.reversed);
      yield SetActiveDateState(
          dateModel: Jiffy().format("dd.MM.yyyy"),
          activeDay: activeDate,
          weekNumber: weekNumber,
          contract: newSortedList);
    } else if (event is AllContractEvent) {
      allBlocContract(List.generate(
          10, (index) => Jiffy().subtract(days: index).format('dd.MM.yyyy')));
      yield SetActiveDateState(
          contract: sortedContract,
          allContract: allContractList,
          activeDay: activeDate,
          weekNumber: weekNumber);
    }
  }

  void createContractList() {
    int numberOfContracts = 100;
    final randomAmountList = [];
    final random = Random();

    final randomInvoiceNumberList = [];
    final randomInvoiceStatusText = [];
    final randomLastInvoiceNumberList = [];
    final randomNumberOfInvoiceList = [];
    final randomInvoiceStatusTextColor = [];
    final randomInvoiceStatusBoxColor = [];
    final randomName = [];
    for (var i = 0; i < numberOfContracts; i++) {
      randomDateList.add(
        Jiffy()
            .add(
                days: (random.nextBool())
                    ? random.nextInt(1)
                    : 0 - random.nextInt(10))
            .format('dd.MM.yyyy')
            .toString(),
      );
    }
    for (var i = 0; i < numberOfContracts; i++) {
      randomAmountList.add((random.nextInt(numberOfContracts) + 2) * 1000000);
    }
    for (var i = 0; i < numberOfContracts; i++) {
      randomInvoiceNumberList.add(random.nextInt(200) + 1);
    }
    for (var i = 0; i < numberOfContracts; i++) {
      randomLastInvoiceNumberList.add(random.nextInt(200) + 1);
    }
    for (var i = 0; i < numberOfContracts; i++) {
      randomNumberOfInvoiceList.add(random.nextInt(11));
    }
    for (var i = 0; i < numberOfContracts; i++) {
      final randomIndex = random.nextInt(3);
      randomInvoiceStatusText.add(MyFakeDate.invoiceStatusList[randomIndex]);
      randomInvoiceStatusBoxColor
          .add(MyFakeDate.invoiceStatusBoxColorList[randomIndex]);
      randomInvoiceStatusTextColor
          .add(MyFakeDate.invoiceStatusTextColorList[randomIndex]);
    }
    for (var i = 0; i < numberOfContracts; i++) {
      final randomIndex = random.nextInt(MyFakeDate.fishList.length);
      randomName.add(MyFakeDate.fishList[randomIndex]);
    }
    this.blocContract = List.generate(
        numberOfContracts,
        (index) => ContractModel(
              invoiceStatusTextColor: randomInvoiceStatusTextColor[index],
              invoiceStatusBoxColor: randomInvoiceStatusBoxColor[index],
              lastInvoiceNum: randomLastInvoiceNumberList[index],
              status: randomInvoiceStatusText[index].toString(),
              name: randomName[index],
              numberOfInvoice: randomNumberOfInvoiceList[index],
              invoiceNumber: randomLastInvoiceNumberList[index],
              amount: randomAmountList[index],
              date: randomDateList[index],
            ));
  }

  void sortContract(String activeDay) {
    sortedContract.clear();
    for (var element in blocContract) {
      if (element.date == activeDay) {
        sortedContract.add(element);
      }
    }
  }

  void allBlocContract(List<String> list) {
    for (var item in list) {
      for (var element in blocContract) {
        if (item == element.date) {
          allContractList.add(element);
        }
      }
    }
  }
}
