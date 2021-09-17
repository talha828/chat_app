import 'package:flutter/material.dart';

class ListTileOfCall extends StatelessWidget {
  ListTileOfCall({this.name,this.image,this.time,this.icon,this.day});
final name;
final day;
final time;
final icon;
final image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 8),
      child: ListTile(
        leading:  Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Color(0xffA8D4AF36), width: 3)),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image)),
                color: Color(0xff173051),
                borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 30,
                width: 30,
              ),
            ),
          ),
        ),
        title: Text(name,style: TextStyle(
            fontSize: 20
        ),),
        subtitle: Text('${day} ,${time}',style: TextStyle(
            color: Colors.grey
        ),),
        trailing: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(icon, size: 20  ,color: Color(0xff173051),),
        ),
      ),
    );
  }
}
