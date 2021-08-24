import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibilling/model/mytextstyles.dart';

class InvoiceStatusBox extends StatelessWidget {

  InvoiceStatusBox({required this.statusBoxColor,required this.statusText,required this.statusTextColor});

  final String statusText;
  final Color statusTextColor;
  final Color statusBoxColor;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: statusBoxColor,
        borderRadius: BorderRadius.circular(8)
      ),
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 2),
      child: Text(statusText,style: MyTextStyles.ubuntuNormal.copyWith(color: statusTextColor,fontSize: 12),),
    );
  }
}
