import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 class VideoCallScreen extends StatefulWidget {
   const VideoCallScreen({Key? key}) : super(key: key);

   @override
   _VideoCallScreenState createState() => _VideoCallScreenState();
 }

 class _VideoCallScreenState extends State<VideoCallScreen> {
   bool color1=true;
   bool color2=false;
   bool color3=true;
   bool color4=false;
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         decoration: BoxDecoration(
           gradient: LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
             colors: [Color(0xff07111e),
                      Color(0xff0f2440),
             ]
           )
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Expanded(
               child: Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,

                   children: [

                     CircleAvatar(
                       radius: 150,
                       backgroundColor: Color(0xff37403d),
                       child: CircleAvatar(
                         radius: 120,
                         backgroundColor: Color(0xff474c3c),
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(100),
                           border: Border.all(width: 5,color: Color(0xff7c7139))
                         ),
                         child: CircleAvatar(
                           radius: 80,
                           backgroundImage: AssetImage('assets/bala2.jpg',),
                         ),
                       ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                       child: Text('Call',style: TextStyle(
                           color: Colors.white,
                           fontSize: 25
                       ),),
                     ),
                   ],
                 ),
               ),
             ),
             Container(
                decoration: BoxDecoration(
                  color: Color(0xff173051),
                borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                ),
               child:Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     GestureDetector(onTap: (){setState(() {color1=color1?false:true;});}, child: CircleAvatar(radius: 25, backgroundColor:color1?Colors.white: Color(0xff455974), child: Padding(padding: const EdgeInsets.all(5.0), child: Icon(Icons.volume_down,color: Color(0xff173051),size: 35,),))),
                     GestureDetector(onTap: (){setState(() {color2=color2?false:true;});},child: CircleAvatar(radius: 25, backgroundColor: color2?Colors.white:Color(0xff455974), child: Padding(padding: const EdgeInsets.all(5.0), child: ImageIcon(AssetImage('assets/brush.png'),color: Color(0xff173051),)))),
                     GestureDetector(onTap: (){setState(() {color3=color3?false:true;});},child: CircleAvatar(radius: 25, backgroundColor:color3?Colors.white: Color(0xff455974), child: Padding(padding: const EdgeInsets.all(5.0), child: Icon(Icons.videocam_off_sharp,color: Color(0xff173051),size: 35,),))),
                     GestureDetector(onTap: (){setState(() {color4=color4?false:true;});},child: CircleAvatar(radius: 25, backgroundColor: color4?Colors.white:Color(0xff455974), child: Padding(padding: const EdgeInsets.all(5.0), child: Icon(Icons.mic,color: Color(0xff173051),size: 35,),))),
                     GestureDetector(onTap: (){Navigator.pop(context);},child: CircleAvatar(radius: 25, backgroundColor: Color(0xff741d31) , child: Padding(padding: const EdgeInsets.all(5.0), child: ImageIcon(AssetImage('assets/hang.png'),color: Color(0xff173051),),))),

                   ],
                 ),
               ),)
           ],
         ),
       ),
     );
   }
 }
