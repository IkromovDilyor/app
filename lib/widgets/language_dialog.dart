
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  _LanguageDialogState createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  SingingCharacter? _character;

void _change(){
  SingingCharacter? _character;
  if(context.locale==Locale('uz', 'UZ')){
    _character=SingingCharacter.uzbek;
  }else if(context.locale==Locale("ru","RU")){
    _character=SingingCharacter.russian;
  }else{
    _character=SingingCharacter.english;
  }
}

  void _changeLanguage(){
    if(_character==SingingCharacter.uzbek){
      context.setLocale(Locale('uz', 'UZ')) ;
    }else if(_character==SingingCharacter.russian){
      context.setLocale(Locale('ru', 'RU'))  ;
    }else if(_character==SingingCharacter.english){

      context.setLocale( Locale('en', 'US')) ;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xff2A2A2D),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Choose a language",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                    ,fontFamily: "Ubuntu"
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32,),

              //uzbek
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                   // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SvgPicture.asset(
                              'assets/icons/uzb_flag.svg'),
                        ),
                      ),
                      Text(
                        "O'zbek (Lotin)",
                        style: TextStyle(
                            color: Color(0xffE7E7E7),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                 Radio(
                   activeColor: Color(0xff008F7F),
                          value: SingingCharacter.uzbek,
                          groupValue:_character,
                          onChanged: (SingingCharacter ? value){
                            setState(() {
                              _character=value;
                            }
                            );
                          },
                        ),

                    ],
                  ),
                ],
              ),
              //russian
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                          'assets/icons/rus_icon.svg'),
                      Text(
                        "Русский",
                        style: TextStyle(
                            color: Color(0xffE7E7E7),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),

                  Radio(
                    activeColor: Color(0xff008F7F),
                    value: SingingCharacter.russian,
                    groupValue:_character,
                    onChanged: (SingingCharacter ? value){
                      setState(() {
                        _character=value;
                      });
                    },

                  ),
                ],
              ),
              //english
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                          'assets/icons/usa_icon.svg'),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'English (USA)',
                          style: TextStyle(
                              color: Color(0xffE7E7E7),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,fontFamily: "Ubuntu"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],

                  ),
                  Radio(
                    activeColor: Color(0xff008F7F),
                    value: SingingCharacter.english,
                    groupValue:_character,
                    onChanged: (SingingCharacter ? value){
                      setState(() {
                        _character=value;
                      });
                    },

                  ),
                ],
              ),

              //#cancel, done
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(6),
                          color: Color(0xff008F7F)
                              .withOpacity(0.3),
                        ),
                        margin: EdgeInsets.only(
                            left: 28, bottom: 28),
                        padding: EdgeInsets.symmetric(
                            vertical: 8, horizontal: 37),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Color(0xff008F7F),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,fontFamily: "Ubuntu"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _changeLanguage();
                        });
                        Navigator.pop(context,);
                      }
                      ,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(6),
                          color: Color(0xff008F7F),
                        ),
                        margin: EdgeInsets.only(
                            bottom: 28, right: 29),
                        padding: EdgeInsets.symmetric(
                            vertical: 8, horizontal: 37),
                        child: Text(
                          "Done",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,fontFamily: "Ubuntu"),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]));
  }
}
enum SingingCharacter { uzbek, russian, english }
