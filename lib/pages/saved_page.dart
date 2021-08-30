import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibilling/model/mycolors.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
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
                      'saved'.tr(),
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
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset('assets/icons/saved_backround_icon.svg',color: Color(0xff2A2A2D),),
                ),
                SizedBox(height: 15,),
                Text("No saved contracts",style:  GoogleFonts.poppins(
                  fontSize: 14, color: MyColors.dark,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
