import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/bloc/calendar_bloc.dart';
import 'package:ibilling/model/translations/locale_keys.g.dart';
import 'package:jiffy/jiffy.dart';
import 'package:easy_localization/easy_localization.dart';

class Calendar extends StatelessWidget {

  int weekNumber = 0; //To Track Scroll of ListView
  List<String> listOfDays = [
    "mo","tu","we","th","fr","sa"

    // LocaleKeys.mo.tr(),
    // LocaleKeys.tu.tr(),
    // LocaleKeys.we.tr(),
    // LocaleKeys.th.tr(),
    // LocaleKeys.fr.tr(),
    // LocaleKeys.sa.tr(),
    // "Mo",
    // "Tu",
    // "We",
    // "Th",
    // "Fr",
    // "Sa",
  ];

  List selectDate(int weekNumber) {
    return List.generate(
      6,
      (index) => Jiffy()
          .add(weeks: weekNumber).subtract(days: 2)
          .add(days: index)
          .dateTime,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E1E20),
        body: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14, left: 16),
                    child: BlocBuilder<CalendarBloc, CalendarState>(
                      builder: (context, state) {
                        if (state is SetActiveDateState) {
                          return Text(
                            Jiffy(Jiffy().subtract(days: Jiffy().day - 2))
                                .add(weeks: state.weekNumber as int)
                                .yMMMM,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffDADADA),
                                fontFamily: "Ubuntu"),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          BlocProvider.of<CalendarBloc>(context)
                              .add(CalendarDecrementEvent());
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset("assets/icons/left.svg",
                              color: Color(0xffD1D1D1) //.withOpacity(0.5),
                              ),
                        ),
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          BlocProvider.of<CalendarBloc>(context)
                              .add(CalendarIncrementEvent());
                          print("clicked right");
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            "assets/icons/right.svg",
                            color: Color(0xffD1D1D1), //.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 28,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 24),
            BlocBuilder<CalendarBloc, CalendarState>(
                builder: (BuildContext context, state) {
              if (state is SetActiveDateState) {
                //  print(state.activeDay);
                return Container(
                  height: 72,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                            selectDate(state.weekNumber as int).length,
                            (index) => CalendarItem(
                                date: selectDate(state.weekNumber as int)[index]
                                    .toString(),
                                onTap: () {
                                  BlocProvider.of<CalendarBloc>(context).add(
                                      SetActiveDateEvent(
                                          activeDay: Jiffy(
                                                  selectDate(weekNumber)[index])
                                              .format('dd.MM.yyyy')));
                                },
                                weekDay: listOfDays[index].tr())),

                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            })
          ],
        ),
      ),
    );
  }
}

class CalendarItem extends StatelessWidget {
  final VoidCallback onTap;
  final String weekDay;
  final String date;

  const CalendarItem(
      {required this.date,
      required this.onTap,
      required this.weekDay,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        if (state is SetActiveDateState) {
          return InkWell(
            onTap: () {
              BlocProvider.of<CalendarBloc>(context).add(SetActiveDateEvent(
                  activeDay: Jiffy(date).format('dd.MM.yyyy').toString()));
            },
            child: Container(
              height: 72,
              width: 46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: state.activeDay == Jiffy(date).format('dd.MM.yyyy')
                      ? Color(0xff00A795)
                      : Color(0xff1E1E20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      weekDay,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          fontFamily: "Ubuntu",
                          color: state.activeDay ==
                                  Jiffy(date).format('dd.MM.yyyy')
                              ? Color(0xffFFFFFF)
                              : Color(0xffD1D1D1).withOpacity(0.5)),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      Jiffy(date).date.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Ubuntu",
                          color: state.activeDay ==
                                  Jiffy(date).format('dd.MM.yyyy')
                              ? Color(0xffFFFFFF)
                              : Color(0xffD1D1D1).withOpacity(0.5)),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  //chiziqcha
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 1,
                      width: 15,
                      color: state.activeDay == Jiffy(date).format('dd.MM.yyyy')
                          ? Color(0xffFFFFFF)
                          : Color(0xffD1D1D1).withOpacity(0.5)),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
