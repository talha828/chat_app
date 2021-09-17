import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  Display({this.imageName});
  final imageName;
  @override
  Widget build(BuildContext context) {
    return    Container(
      alignment: Alignment.center,
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 10,color: Colors.white),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          )]
      ),
      child: CircleAvatar(
        radius: 100,
        backgroundColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ImageIcon(
                AssetImage(imageName),
                size: 110,
                color: Colors.indigo[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
