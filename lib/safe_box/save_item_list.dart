import 'package:flutter/material.dart';

class SaveItem extends StatelessWidget {
  SaveItem({this.icon,this.title,this.subtitle,this.color});
  final icon;
  final color;
  final title;
  final subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),         color: color,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),

            child: Icon(icon,color: Colors.white,size: 35,),
          ),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
