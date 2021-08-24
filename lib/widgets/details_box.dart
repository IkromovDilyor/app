import 'package:flutter/cupertino.dart';


class DetailsBox extends StatelessWidget {
final String detailName;
final String detail;
DetailsBox({required this.detail,required this.detailName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Text.rich(
        TextSpan(
          text: detailName,
          style: TextStyle(color: Color(0xffE7E7E7),fontSize: 14,fontFamily: "Ubuntu",fontWeight: FontWeight.w500),
          children:[
            TextSpan(
              text: detail,
              style: TextStyle(color: Color(0xff999999),fontWeight: FontWeight.w400,fontSize: 14,fontFamily: "Ubuntu")
            )
          ]
        )
      ),
    );
  }
}
