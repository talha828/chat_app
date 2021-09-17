import 'package:flutter/material.dart';

class CoinButton extends StatelessWidget {
  CoinButton({this.texts,this.icon});
  final texts;
  final icon;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Color(0xffefeff2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(texts,style: TextStyle(
                color: Color(0xfF2173051),fontSize: 20
            ),),
            Icon(icon,size: 30,color:Color(0xffc4c9d1),)
          ],
        ),
      ),);
  }
}
