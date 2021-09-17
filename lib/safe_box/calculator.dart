import 'package:chat_app/safe_box/safe_box_items.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../chat_screen/main_chat_screen.dart';

 class Calculator extends StatefulWidget {
   @override
   _CalculatorState createState() => _CalculatorState();
 }

 class _CalculatorState extends State<Calculator> {
   late String  result=text2+sign+text1+'set 4 digit password';
   late String text1='';
   late String text2='';
   late String sign='';
   late String save;
   late String fianlresult;
   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: Scaffold(
         body:  SingleChildScrollView(
           child: Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             decoration: BoxDecoration(
               color: Color(0xff173051)
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Row(
                     children: [
                       Container(
                         child: GestureDetector(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                           },
                           child: Container(
                             height: 40,
                             width: 40,
                             decoration: BoxDecoration(
                                 color: Color(0xffd4af36), shape: BoxShape.circle),
                             child: Icon(
                               Icons.arrow_back,
                               color: Colors.white,
                             ),
                           ),
                         ),
                       ),
                       Expanded(child: Container(
                         alignment: Alignment.center,
                         child: Text('SafeBox',style: TextStyle(
                           color: Colors.white,
                         fontSize: 25
                         ),),
                       ))
                     ],
                   ),
                 ),
                 Expanded(
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                       color: Colors.white,
                     ),
                     child:Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                       children: [
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 20),
                           child: Container(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Container(
                                   padding: EdgeInsets.all(15),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(15),color: Color(0xfff2e7c2)
                                   ),
                                   child: ImageIcon(AssetImage('assets/box.png'),color: Color(0xffd4af36),size: 30,),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                     Text('Type the code to access',style: TextStyle(
                                       color: Color(0xffd4af36),
                                       fontSize: 18
                                     ),),
                                     Text('your saved contents',style: TextStyle(
                                         color: Color(0xffd4af36),
                                         fontSize: 18
                                     ),),
                                   ],),
                                 )
                               ],
                             ),
                           ),
                         ),
                         Divider(thickness: 2,color: Colors.grey.shade300,),
                         Container(
                           height: 180,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.all(12.0),
                                 child: Text(result,style: TextStyle(
                                   color: Colors.grey.shade500,
                                   fontSize: 40
                                 ),),
                               ),
                             ],
                           ),
                         ),
                         Expanded(
                           child: Container(
                              color: Color(0xffedeef2),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                Expanded(
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ButtonCal(text: '7',onPress: (){setState(() {text1=text1+'7';result=text2+sign+text1;print(result);});},),
                                            ButtonCal(text: '4',onPress: (){setState(() {text1=text1+'4';result=text2+sign+text1;print(result);});},),
                                            ButtonCal(text: '1',onPress: (){setState(() {text1=text1+'1';result=text2+sign+text1;print(result);});},),
                                            ButtonCal(text: '0',onPress: (){setState(() {text1=text1+'0';result=text2+sign+text1;print(result);});},),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ButtonCal(text: '8',onPress: (){setState(() {text1=text1+'8';result=text2+sign+text1;print(result);});},),
                                            ButtonCal(text: '5',onPress: (){setState(() {text1=text1+'5';result=text2+sign+text1;print(result);});},),
                                            ButtonCal(text: '2',onPress: (){setState(() {text1=text1+'2';result=text2+sign+text1;print(result);});},),
                                            ButtonCal(text: '.',onPress: (){setState(() {text1=text1+'.';result=text2+sign+text1;print(result);});},),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ButtonCal(text: '9',onPress: (){setState(() {text1=text1+'9';result=text2+sign+text1;print(result);});},),
                                            ButtonCal(text: '6',onPress: (){setState(() {text1=text1+'6';result=text2+sign+text1;print(result);});},),
                                            ButtonCal(text: '3',onPress: (){setState(() {text1=text1+'3';result=text2+sign+text1;print(result);});},),
                                            ButtonCal(text: '=',onPress: (){setState(() {
                                              save=result;
                                              if(save==result){Navigator.push(context, MaterialPageRoute(builder: (context)=>SafeBox()));}
                                                      if(sign=='*'){
                                                        var long2 = num.tryParse('$text1')?.toDouble();
                                                        var long1 = num.tryParse('$text2')?.toDouble();
                                                      var talha =long1! * long2!;
                                                      result=talha.toString();
                                                      text2='';
                                                      sign='';
                                                      text1='';
                                                      }
                                                      if(sign=='/'){
                                                        var long2 = num.tryParse('$text1')?.toDouble();
                                                        var long1 = num.tryParse('$text2')?.toDouble();
                                                        var talha =long1! / long2!;
                                                        result=talha.toString();
                                                        text2='';
                                                        sign='';
                                                        text1='';
                                                      }
                                                      if(sign=='+'){
                                                        var long2 = num.tryParse('$text1')?.toDouble();
                                                        var long1 = num.tryParse('$text2')?.toDouble();
                                                        var talha =long1! + long2!;
                                                        result=talha.toString();
                                                        text2='';
                                                        sign='';
                                                        text1='';
                                                      }
                                                      if(sign=='-'){
                                                        var long2 = num.tryParse('$text1')?.toDouble();
                                                        var long1 = num.tryParse('$text2')?.toDouble();
                                                        var talha =long1! - long2!;
                                                        result=talha.toString();
                                                        text2='';
                                                        sign='';
                                                        text1='';
                                                      }

                                            });},),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                 Container(
                                   color: Color(0xffd7dbe1),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       ButtonCalCu(icon:FontAwesomeIcons.timesCircle,onPress: (){setState(() {
                                         text2='';
                                         sign='';
                                         text1='';
                                         result='';
                                       });},),
                                       ButtonCalCu(icon: FontAwesomeIcons.divide,onPress: (){setState(() {sign='/';text2=text1;text1='';result=text2+sign+text1;print(result);});},),
                                       ButtonCalCu(icon: FontAwesomeIcons.minus,onPress: (){setState(() {sign='-';text2=text1;text1='';result=text2+sign+text1;print(result);});},),
                                       ButtonCalCu(icon: FontAwesomeIcons.times,onPress: (){setState(() {sign='*';text2=text1;text1='';result=text2+sign+text1;print(result);});},),
                                       ButtonCalCu(icon: FontAwesomeIcons.plus,onPress: (){setState(() {sign='+';text2=text1;text1='';result=text2+sign+text1;print(result);});},)

                                     ],
                                 ),)
                               ],
                             ),
                           ),
                         )
                       ],
                     )
                   ),
                 )
               ],
             ),
           ),
         ),
       ),
     );
   }
 }


class ButtonCal extends StatefulWidget {
  ButtonCal({this.text,this.onPress});
  final text;
  final onPress;

  @override
  _ButtonCalState createState() => _ButtonCalState();
}

class _ButtonCalState extends State<ButtonCal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:    GestureDetector(
        onTap: widget.onPress,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),color: Colors.white
          ),
          child: Text(widget.text,style: TextStyle(
              color: Color(0xff173051),
              fontSize: 24
          ),),
        ),
      ),
    );
  }
}
class ButtonCalCu extends StatefulWidget {
  ButtonCalCu({this.icon,this.onPress});
  final icon;
  final onPress;

  @override
  _ButtonCalCuState createState() => _ButtonCalCuState();
}

class _ButtonCalCuState extends State<ButtonCalCu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:    GestureDetector(
        onTap: widget.onPress,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),color: Color(0xffd7dbe1)
            ),
            child: Icon(widget.icon,size: 24,color: Color(0xff173051),)
        ),
      ),
    );
  }
}

