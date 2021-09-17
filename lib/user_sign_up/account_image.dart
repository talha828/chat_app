import 'package:flutter/material.dart';



class AccountImage extends StatefulWidget {
  @override
  _AccountImageState createState() => _AccountImageState();
}

class _AccountImageState extends State<AccountImage> {
   dynamic iamge='assets/user.png';
   bool picker =true;
   @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        textDirection: TextDirection.rtl,
        fit: StackFit.loose,
        overflow: Overflow.visible,
        clipBehavior: Clip.hardEdge,
        children:[
          Positioned(child:
          Container(
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
                      AssetImage('assets/user.png'),
                      size: 110,
                      color: Colors.indigo[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ),
          Positioned(
              top: 145,
              right:90,
              child:  FloatingActionButton(onPressed: ()async{},
                backgroundColor: Color(0xffd4af36),
                child: Icon(
                  Icons.add,
                  size: 29,
                ),
              ))
        ]);
  }
}
