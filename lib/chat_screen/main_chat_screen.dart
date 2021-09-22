import 'package:chat_app/chat_screen/chat_room.dart';
import 'package:chat_app/group_info.dart';
import 'package:chat_app/location/location_page.dart';
import 'package:chat_app/safe_box/calculator.dart';
import 'package:chat_app/call/call_screen.dart';
import 'package:chat_app/chat_screen/chat_search.dart';
import 'package:chat_app/switch_account.dart';
import 'package:chat_app/wallet/bit_wallet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';


import '../user_sign_up/login_page.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool status= true;
  FirebaseAuth _auth= FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  var myName;
  var myImage;
  var image;
  late String groupName;
  onlineStatus()async{
   final myname =_auth.currentUser!.email;
   print(myname?.replaceAll('@gmail.com', ''));
   myName=myname?.replaceAll('@gmail.com', '');
  final myData = users.doc(_auth.currentUser!.uid).get() ;
   myImage =await myData.then((value) => value['image']);
   var now =TimeOfDay.minutesPerHour;
   print(now);

   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onlineStatus();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
          alignment: Alignment.topRight,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
            color: Color(0xff173051),
             child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                  children: [
                    GestureDetector(child: ImageIcon(AssetImage('assets/app_icon.png'),color: Color(0xffc69b68),size: 35,)),
                    GestureDetector(child: ImageIcon(AssetImage('assets/message_icon.png'),color: Colors.white,size: 35,)),
                    GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BitWallet()));},child: ImageIcon(AssetImage('assets/dollar_icon.png'),color: Colors.white24,size: 35,)),
                    GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationPage()));}, child: ImageIcon(AssetImage('assets/location_icon.png'),color: Colors.white24,size: 35,)),
                    GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatSearch()));},child: ImageIcon(AssetImage('assets/search_icon.png'),color: Colors.white24,size: 40,)),
                    PopupMenuButton(
                        elevation: 3.2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Center(
                            child: ImageIcon(
                              AssetImage('assets/menu-icon.png'),
                              color: Color(0xffcfa577),
                              size: 30,
                            )),
                        itemBuilder: (context) =>
                        [
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>GroupInfo()));
                              },
                              child: Text(
                                "New Group",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder:(context)=>SwitchAccount()));
                              },
                              child: Text(
                                "Switch Account",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            value: 2,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Send Crypto",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            value: 3,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "VPN",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            value: 4,
                          ),
                          PopupMenuItem(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Online Status",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: CustomSwitch(
                                    activeColor: Color(0xff52cc56),
                                    value: status,
                                    onChanged: (value) {
                                      status=status?false:true;
                                      print(status);
                                      users.doc(_auth.currentUser!.uid).update({'status':status});
                                    },
                                  ),
                                ),
                              ],
                            ),
                            value: 5,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Invite Friends",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            value: 6,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Settings",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            value: 7,
                          ),

                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: (){
                                FirebaseAuth _auth=FirebaseAuth.instance;
                                users.doc(_auth.currentUser!.uid).update({'status':false});
                                _auth.signOut().whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage())));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Divider(thickness: 2,color: Colors.grey,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                    "Logout",
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                ),
                                  ),]
                              ),
                            ),
                            value: 8,
                          ),
                        ]),                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                    ),

                    child:Container(

                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('message/${_auth.currentUser!.uid}/userList').snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if(!snapshot.hasData){
                              return CircularProgressIndicator();
                            }
                            return SizedBox(
                              height: 600,
                              child: new ListView(
                                  children: snapshot.data!.docs.reversed.map((data) =>  ListTile(
                                    onTap: (){
                                      print(data['Name']);
                                      print(data['uid']);

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(myImage: myImage,myName: myName, userName: data['Name'],userImage: data['Image'],userStatus:status,userUid: data['uid'],group: data['group'],)));
                                    },
                                    leading:Stack(
                                      alignment: Alignment.center,
                                      children:[
                                        Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Color(0xfff2e7c2) ,width: 3),
                                                    borderRadius: BorderRadius.circular(30)
                                                  ),
                                        child: Container(
                                          width: 50,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 5,color: Colors.white),
                                            borderRadius: BorderRadius.circular(50),
                                            image: DecorationImage(image: NetworkImage(data['Image']),fit:BoxFit.cover)
                                          ),
                                        ),

                                      ),
                                        Positioned(bottom: 5,
                                          right: 1,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 5,
                                              backgroundColor:(data['status']==true)?Colors.green:Color(0xffbebebe),
                                            ),
                                          ),
                                        ),]
                                    ),
                                    title: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(data['Name'],style: TextStyle(
                                        fontSize: 22
                                      ),),
                                    ),
                                    subtitle: StreamBuilder(
                                      stream:(data['group']==true)?FirebaseFirestore.instance.collection('message/${data['uid']}/${data['Name']}').orderBy('timestamp',descending: true).limit(1).snapshots() :FirebaseFirestore.instance.collection('message/${_auth.currentUser!.uid}/${data['Name']}').orderBy('timestamp',descending: true).limit(1).snapshots(),
                                    builder:  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                        if(!snapshot.hasData){
                                          return CircularProgressIndicator();
                                        }

                                        return  Container(
                                            height:17,
                                            child: Text('${snapshot.data!.docs.map((data) => data['message'])}'));
                                    },
                                     ),
                                    trailing: Text('11:00'),

                                  ),).toList()),
                            );
                          }
                      )
                    )

                    ),
                     Positioned(
                      bottom: 220,
                      right: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(    heroTag: 'btn4',onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Calling()));},child: Icon(Icons.phone,color: Colors.white,),backgroundColor:  Color(0xff173051),),
                      )),
                    Positioned(
                        bottom: 150,
                        right: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(    heroTag: 'btn3',onPressed: (){},child:ImageIcon(AssetImage('assets/status.png'),size: 30,),backgroundColor: Color(0xff173051)),
                        )),
                    Positioned(
                        bottom: 80,
                        right: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(    heroTag: 'btn2',onPressed: (){},child:ImageIcon(AssetImage('assets/plus_message.png',),size: 40,),backgroundColor: Color(0xff173051),),
                        )),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                              heroTag: 'btn1',
                              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Calculator()));},child: ImageIcon(AssetImage('assets/box.png')),backgroundColor: Color(0xff173051)),
                        ))
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
