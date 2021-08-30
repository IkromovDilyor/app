import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/bloc/calendar_bloc.dart';
import 'package:ibilling/model/lists_date.dart';
import 'package:jiffy/jiffy.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:easy_localization/easy_localization.dart';

class AddConstractPage extends StatefulWidget {
  static final String id = "addConstract_page";


  const AddConstractPage({Key? key}) : super(key: key);

  @override
  _AddContractPageState createState() => _AddContractPageState();
}

class _AddContractPageState extends State<AddConstractPage> {

  final fullNamecontroller=TextEditingController();
  final adresController=TextEditingController();
  final innController=TextEditingController();
  String date='';
  String name='';
  String litsoListname="юридичиские";
   String invoiceStatus="Paid";
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: KeyboardDismisser(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
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
                        'New Contract',
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
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  margin: EdgeInsets.only(bottom: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "face".tr(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffF1F1F1).withOpacity(0.4),fontFamily: "Ubuntu"),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.grey.shade700),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            dropdownColor: Colors.black,
                            isDense: true,
                            icon: SvgPicture.asset('assets/icons/to_bottom_icon.svg',color: Color(0xffF1F1F1).withOpacity(0.4),),
                            value: litsoListname,
                            onChanged: (String? newValue) {
                              setState(
                                    () {
                                      litsoListname = newValue!;
                                },
                              );
                            },
                            items: ["юридичиские", "физичиские"].map<DropdownMenuItem<String>>(( value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Container(
                                  child: GestureDetector(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(value,style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "name".tr(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffF1F1F1).withOpacity(0.4),fontFamily: "Ubuntu"),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 16,
                          ),
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Color(0xffF1F1F1).withOpacity(0.4),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                    controller: fullNamecontroller,
                                    style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "adress".tr(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffF1F1F1).withOpacity(0.4),fontFamily: "Ubuntu"),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 16,
                          ),
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Color(0xffF1F1F1).withOpacity(0.4),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                    controller: adresController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "ИНН",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffF1F1F1).withOpacity(0.4),fontFamily: "Ubuntu"),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 16,
                          ),
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Color(0xffF1F1F1).withOpacity(0.4),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                    controller: innController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              )),
                              Padding(
                                padding: EdgeInsets.only(right: 13),
                                child: SvgPicture.asset(
                                  'assets/icons/question_icon.svg',
                                  color: Color(0xffF1F1F1).withOpacity(0.4),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "paid".tr(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffF1F1F1).withOpacity(0.4),fontFamily: "Ubuntu"),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.grey.shade700),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,

                            dropdownColor: Colors.black,
                            isDense: true,
                            icon: SvgPicture.asset('assets/icons/to_bottom_icon.svg',color: Color(0xffF1F1F1).withOpacity(0.4),),
                            value: invoiceStatus,
                            onChanged: (String? newValue) {
                              setState(
                                    () {
                                  invoiceStatus = newValue!;
                                },
                              );
                            },
                            items: MyFakeDate.invoiceStatusList.map<DropdownMenuItem<String>>(( value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Container(
                                  child: GestureDetector(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(value,style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: (){
                           this.date=Jiffy().format("dd.MM.yyyy");
                           if(_formKey.currentState!.validate()){
                             BlocProvider.of<CalendarBloc>(context).add(AddContractEvent(
                               date: date,name: fullNamecontroller.text,status: invoiceStatus,
                             ));
                             ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                 content: Text('Contract Saved'),
                                 duration: Duration(seconds: 1),
                               ),
                             );
                           }
                           },

                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xff008F7F).withOpacity(0.6)),
                            child: Center(
                              child: Text(
                                "save".tr(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFDFDFD),fontFamily: "Ubuntu"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
