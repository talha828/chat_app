import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({this.onPress,this.text,this.icon});
  final onPress;
  final text;
  final icon;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,),
        alignment: Alignment.center,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xffd4af36),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(text,style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                 icon,color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
