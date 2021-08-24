import 'package:flutter/material.dart';

class InvoiceModel {
  String date;
  String? activeDay;
  InvoiceModel({
    required this.date,
    this.activeDay,
  }) ;
}

class ContractModel {
  int invoiceNumber;
  String name;
  int amount;
  int lastInvoiceNum;
  int numberOfInvoice;
  String date;
  String status;
  Color invoiceStatusTextColor;
  Color invoiceStatusBoxColor;
  ContractModel({
    required this.invoiceNumber,
    required this.name,
    required this.amount,
    required this.lastInvoiceNum,
    required this.numberOfInvoice,
    required this.date,
    required this.status,
    required this.invoiceStatusTextColor,
    required this.invoiceStatusBoxColor,
  });
}