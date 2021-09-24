import 'dart:io';
import 'package:chat_app/safe_box/save_Image.dart';
import 'package:chat_app/safe_box/save_item_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class SafeBox extends StatefulWidget {
  const SafeBox({Key? key}) : super(key: key);

  @override
  _SafeBoxState createState() => _SafeBoxState();
}

class _SafeBoxState extends State<SafeBox> {

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
                            Navigator.pop(context);
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
               Expanded(child: Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),   color: Colors.white,
                 ),
                 child: ListView(
                   children: [
                      SaveItem(onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SafeImage()));}, icon: FontAwesomeIcons.file,title: 'File',subtitle: '123 items save',color: Color(0xfff3c04b),),
                  Divider(thickness: 2,color: Colors.grey.shade300,),
                     SaveItem(onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SafeMedia()));},icon: FontAwesomeIcons.image,title: 'Photos',subtitle: '123 items save',color: Color(0xffbd58ce),),
                     Divider(thickness: 2,color: Colors.grey.shade300,),
                     SaveItem(icon: FontAwesomeIcons.music,title: 'Audio',subtitle: '123 items save',color: Color(0xfff78e0e),),
                     Divider(thickness: 2,color: Colors.grey.shade300,),
                     SaveItem(icon: FontAwesomeIcons.playCircle,title: 'video',subtitle: '123 items save',color: Color(0xff60c255),),
                     Divider(thickness: 2,color: Colors.grey.shade300,),
                     SaveItem(icon: Icons.messenger,title: 'Message',subtitle: '123 items save',color: Color(0xff4b78e2),),
                     Divider(thickness: 2,color: Colors.grey.shade300,),
                     SaveItem(icon: Icons.my_location_outlined,title: 'location',subtitle: '123 items save',color: Color(0xff0eaaf4),),
                     Divider(thickness: 2,color: Colors.grey.shade300,),
                   ],
                 ),
              ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
