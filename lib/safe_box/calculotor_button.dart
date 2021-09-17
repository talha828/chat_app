import 'package:flutter/material.dart';
late String  result='';
late String text1;
late String text2;
late String fianlresult;

class ButtonCal extends StatefulWidget {
  ButtonCal({this.text,});
  final text;

  @override
  _ButtonCalState createState() => _ButtonCalState();
}

class _ButtonCalState extends State<ButtonCal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:    GestureDetector(
        onTap: (){
          setState(() {
            text1=widget.text;
            result=result+text1;
            print(result);
          });
        },
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
