import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibilling/bloc/calendar_bloc.dart';
import 'package:ibilling/model/model.dart';
import 'package:ibilling/model/mycolors.dart';
import 'package:ibilling/model/translations/locale_keys.g.dart';
import 'package:ibilling/pages/all_contract_page.dart';
import 'package:ibilling/widgets/calendar.dart';
import 'package:ibilling/widgets/contract_card.dart';
import 'package:easy_localization/easy_localization.dart';

class ContractPage extends StatelessWidget {
  static final String id = "contract_page";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(builder: (context, state) {
      if (state is SetActiveDateState) {
        return ContractPageItems(
          contract: state.contract,
        );
      } else {
        return SizedBox();
      }
    });
  }
}

class ContractPageItems extends StatelessWidget {
  final List<ContractModel> contract;

  const ContractPageItems({required this.contract});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
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
                        'contract'.tr(),
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
            child: Column(
              children: [
                //#calendar
                Container(
                  height: 148,
                  color: Color(0XFF1E1E20),
                  child: Calendar(),
                ),
                SizedBox(
                  height: 24,
                ),

                Expanded(
                    child: (contract.isEmpty)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/dacument.svg',
                                color: MyColors.dark,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "noContract".tr(),
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: MyColors.dark),
                              )
                            ],
                          )
                        : ListView(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            shrinkWrap: true,
                            children: [
                              Column(
                                children: [
                                  //#text
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<CalendarBloc>(context)
                                              .add(AllContractEvent());
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      AllContract()));
                                        },
                                        child: Container(
                                          height: 33,
                                          width: 92,
                                          decoration: BoxDecoration(
                                              color: Color(0xff00A795),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Center(
                                              child: Text(
                                                  "app_bar_contract".tr(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xffFFFFFF),
                                                      fontFamily: "Ubuntu"))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 28,
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "invoice".tr(),
                                            style: TextStyle(
                                                color: Color(0xffFFFFFF),
                                                fontSize: 15,
                                                fontFamily: "Ubuntu"),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ...List.generate(
                                    contract.length,
                                    (index) => ContractCard(
                                        contractModel: contract[index]),
                                  )
                                ],
                              )
                            ],
                          )

                    // ListView.builder(
                    //   itemBuilder: (ctx, index){
                    //     return InfoPage(info: Info.infoList[index],);
                    //     } ,
                    //    itemCount: Info.infoList.length,
                    // )

                    )
              ],
            ),
          )),
    );
  }
}
