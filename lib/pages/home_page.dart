import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ibilling/model/constants.dart';

import 'package:ibilling/widgets/bottom_bar_item.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  bool isUploadContractPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Constants.pagesList(isAddContractPage: isUploadContractPage)[index],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            Constants.bottomNavBarItems.length,
            (index) =>
                BottomNavBarItem(
              bottomNavBarItemModel: Constants.bottomNavBarItems[index],
              onTap: () {
                if (index == 2) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                            insetPadding: EdgeInsets.symmetric(horizontal: 24),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff2A2A2D),
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "create".tr(),
                                    style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Ubuntu"),
                                  ),
                                  SizedBox(
                                    height: 28,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isUploadContractPage = true;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Color(0xff4E4E4E)
                                              .withOpacity(0.4)),
                                      padding: EdgeInsets.only(
                                          left: 19, top: 12, bottom: 12),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/uload_consttract_icon.svg'),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                              child: Text(
                                            "contract".tr(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffE7E7E7)),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isUploadContractPage = false;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Color(0xff4E4E4E)
                                              .withOpacity(0.4)),
                                      padding: EdgeInsets.only(
                                        left: 19,
                                        top: 12,
                                        bottom: 12,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/invoice_icon.svg'),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                              child: Text(
                                            "invoice".tr(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffE7E7E7),
                                                fontFamily: "Ubuntu"),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  )
                                ],
                              ),
                            ),
                          ));
                }
                setState(() {
                  Constants.bottomNavBarItems.forEach((element) {
                    element.isActive = false;
                    Constants.bottomNavBarItems[index].isActive = true;
                    this.index = index;
                  });
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

