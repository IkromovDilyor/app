import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddInvoicePage extends StatefulWidget {
  const AddInvoicePage({Key? key}) : super(key: key);
  @override
  _AddInvoicePageState createState() => _AddInvoicePageState();
}

class _AddInvoicePageState extends State<AddInvoicePage> {
  String? dropDownValue = 'first';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  'New Invoice',
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
          width: double.infinity,
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Лицо",
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
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Color(0xffF1F1F1).withOpacity(0.4),
                    width: 1,
                  ),
                ),
                child:TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ) ,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Fisher’s full name",
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
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Address of the organization",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF1F1F1).withOpacity(0.4),fontFamily:"Ubuntu"),
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
              SizedBox(
                height: 24,
              ),
              Container(
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xff008F7F).withOpacity(0.6)),
                child: Center(
                  child: Text(
                    "Save Invoice",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFDFDFD),fontFamily: "Ubuntu"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
