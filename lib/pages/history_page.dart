import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/model/mycolors.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var fromDate;
  var toDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/icons/app_logo.png'),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'history'.tr(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: "Ubuntu"),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/Filter.svg'),
                    SizedBox(
                      width: 21,
                    ),
                    SvgPicture.asset("assets/icons/Line 1.svg"),
                    SizedBox(
                      width: 21,
                    ),
                    SvgPicture.asset(
                      "assets/icons/Vector.svg",
                    ),
                  ],
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(51),
        ),
        body: Container(
          width: double.infinity,
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Date",
                style: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Ubuntu"),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000))
                          .then((value) {
                        setState(() {
                          fromDate = value;
                        });
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MyColors.dark,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (fromDate == null)
                                ? DateFormat("dd.MM.yyyy")
                                    .format(DateTime.now())
                                    .toString()
                                : DateFormat("dd.MM.yyyy")
                                    .format(fromDate)
                                    .toString(),
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          SvgPicture.asset('assets/icons/calendar_icon.svg')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    height: 2,
                    width: 8,
                    color: MyColors.grey,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000),
                      ).then((value) {
                        setState(() {
                          toDate = value;
                        });
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MyColors.dark,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (toDate == null)
                                ? 'To'
                                : DateFormat("dd.MM.yyyy")
                                .format(toDate)
                                .toString(),
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          (toDate == null)?
                          SizedBox(
                            width: 62,
                          ) : SizedBox(width: 6,),
                          SvgPicture.asset('assets/icons/calendar_icon.svg')
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/defold_image.svg',
                      color: MyColors.dark,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "noHistory".tr(),
                      style: TextStyle(color: MyColors.dark),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
