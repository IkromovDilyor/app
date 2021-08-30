import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/bloc/calendar_bloc.dart';
import 'package:ibilling/model/model.dart';
import 'package:ibilling/widgets/contract_card.dart';

class AllContractPage extends StatelessWidget {
  static final String id="all_contract_page";
  final List<ContractModel>allContract;
  const AllContractPage({ required this.allContract}) ;
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
                    SvgPicture.asset('assets/icons/icon_infos_const.svg'),

                    SizedBox(width: 12,),
                    Text('№ 153', style: TextStyle(fontSize:18, fontWeight: FontWeight.w500, color: Colors.white,fontFamily: "Ubuntu"),)
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/saved_icon_unselect.svg'),

                  ],
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(51),
        ),
        body: Container(
          color: Colors.black,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
          child:
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 8),
                shrinkWrap: true,
                children: [
                  ...List.generate(allContract.length, (index) =>
                      ContractCard(contractModel:allContract[index]),

                  )
                ],
              )



      ),
      ),
    );
  }
}

class AllContract extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state){
        if(state is SetActiveDateState){
          return AllContractPage(allContract: state.allContract!,);
        }else{
          return SizedBox();
        }
      },
    );
  }
}

