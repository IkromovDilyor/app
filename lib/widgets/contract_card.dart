import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/model/model.dart';
import 'package:ibilling/model/mycolors.dart';
import 'package:easy_localization/easy_localization.dart';

import 'details_box.dart';
import 'invoice_status_box.dart';

class ContractCard extends StatelessWidget {
  final ContractModel contractModel;

  ContractCard({required this.contractModel,});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 148,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: MyColors.dark),
        ),
        Positioned(
          top: 12,
          left: 10,
          child: SvgPicture.asset('assets/icons/icon_infos_const.svg'),
        ),
        Positioned(
          top: 12,
          left: 34,
          child:Text(
            '№ ${contractModel.invoiceNumber}',
            style: TextStyle(color: Color(0xffE7E7E7),fontWeight: FontWeight.w700,fontFamily: "Ubuntu"),
          ),
        ),
        Positioned(
          top: 44,
          left: 12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsBox(
                  detailName:"fish".tr(), detail: contractModel.name),
              DetailsBox(
                  detailName:"amount".tr(),
                  detail: contractModel.amount.toString()+" UZS"),
              DetailsBox(
                  detailName:"lastInvoice".tr(),
                  detail: "№ ${contractModel.lastInvoiceNum}"),
              DetailsBox(
                  detailName:"NumberOfInvoice".tr(),
                  detail: contractModel.numberOfInvoice.toString()),
            ],
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: InvoiceStatusBox(
            statusText: contractModel.status,
            statusBoxColor: contractModel.invoiceStatusBoxColor,
            statusTextColor: contractModel.invoiceStatusTextColor,
          ),
        ),
        Positioned(
    top: 116,
    right: 12,
    child: Text(
    contractModel.date,
    style: TextStyle(color: Color(0xff999999),fontSize: 14 , fontWeight: FontWeight.w700,fontFamily: "Ubuntu"),
        )
        )],
    );
  }
}
