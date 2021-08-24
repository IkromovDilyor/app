import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/model/translations/locale_keys.g.dart';
import 'package:ibilling/widgets/language_dialog.dart';
class ProfilePage extends StatefulWidget {
  static final String id = "profile_page";
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            color: Colors.black,
            child: Row(
              children: [
                Image.asset('assets/icons/app_logo.png'),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'profile'.tr(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,fontFamily: "Ubuntu"),
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(51),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xff2A2A2D)),
                width: double.infinity,
                margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/profile_icon.svg'),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Otabek Abdusamatov",
                              style: TextStyle(
                                  color: Color(0xff00A795),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,fontFamily: "Ubuntu"),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Graphic designer•IQ Education",
                              style: TextStyle(color: Color(0xffE7E7E7),fontFamily: "Ubuntu"),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "dateOfBirth".tr(),
                        style: TextStyle(
                            color: Color(0xffE7E7E7),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,fontFamily: "Ubuntu"),
                      ),
                      TextSpan(
                          text: "  16.09.2001",
                          style:
                              TextStyle(color: Color(0xff999999), fontSize: 14,fontFamily: "Ubuntu"))
                    ])),
                    SizedBox(
                      height: 12,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "phoneNumber".tr(),
                        style: TextStyle(
                            color: Color(0xffE7E7E7),
                            fontWeight: FontWeight.w500
                            ,fontFamily: "Ubuntu",
                            fontSize: 16),
                      ),
                      TextSpan(
                          text: "  +998 97 721 06 88",
                          style:
                              TextStyle(color: Color(0xff999999), fontSize: 14,fontFamily: "Ubuntu"))
                    ])),
                    SizedBox(
                      height: 12,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "email".tr(),
                        style: TextStyle(
                            color: Color(0xffE7E7E7),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,fontFamily: "Ubuntu"),
                      ),
                      TextSpan(
                          text: "  predatorhunter041@gmail.com",
                          style:
                              TextStyle(color: Color(0xff999999), fontSize: 14,fontFamily: "Ubuntu"),)
                    ])),
                  ],
                ),
              ),
              SizedBox(
                height: 11,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius
                              .circular(10)
                        ),
                      
                          insetPadding: EdgeInsets.symmetric(horizontal: 24),
                          child: LanguageDialog()
                      )
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                      color: Color(0xff2A2A2D),
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "English (USE)",
                        style: TextStyle(color: Colors.white,fontFamily: "Ubuntu"),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SvgPicture.asset('assets/icons/flag_us.svg')),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

