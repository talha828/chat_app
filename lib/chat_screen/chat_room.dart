import 'package:chat_app/bottom_sheet/bottom_sheet.dart';
import 'package:chat_app/call/call_screen.dart';
import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:chat_app/chat_screen/chat_text.dart';
import 'package:chat_app/chat_screen/selected_row.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ChatRoom extends StatefulWidget {
  ChatRoom({this.userName, this.userImage,this.userStatus,this.userUid,this.myName, this.myImage,this.group});
  final userName;
  final userImage;
  final userStatus;
  final userUid;
  final myName;
  final myImage;
  final group;
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
 String Want='BTC';
 bool iconStatus=false;
 late String message;
 TextEditingController _controller =TextEditingController();
 FirebaseAuth _auth=FirebaseAuth.instance;
 FirebaseFirestore db = FirebaseFirestore.instance;
 CollectionReference users = FirebaseFirestore.instance.collection('user');
 bool sendByMe=true;

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topRight,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xff173051),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
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
                      Row(
                        children: [
                          Container(
                            width: 55.0,
                            height: 55.0,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: Colors.white70,
                                width: 2.0,
                              ),
                            ),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(widget.userImage),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(
                                  color: Color(0xff173051),
                                  width: 5.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          SingleChildScrollView(
                            child: Text(
                              widget.userName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:widget.userStatus?Color(0xFF61AC3C):Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      PopupMenuButton(
                          elevation: 3.2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Center(
                              child: ImageIcon(
                                AssetImage('assets/menu-icon.png'),
                                color: Color(0xffd4af36),
                                size: 30,
                              )),
                          itemBuilder: (context) =>
                          [
                            PopupMenuItem(
                              child: Text(
                                "See Profile",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Calling(image: widget.userImage,name: widget.userName,)));
                                },
                                child: Text(
                                  "Call",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                              value: 2,
                            ),
                            PopupMenuItem(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Calling()));
                                },
                                child: Text(
                                  "Video Call",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                              value: 3,
                            ),
                            PopupMenuItem(
                              child: Text(
                                "Send Crypto",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                              value: 4,
                            ),
                            PopupMenuItem(
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                              value: 5,
                            ),
                            PopupMenuItem(
                              child: Text(
                                "Block",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                              value: 6,
                            ),
                            PopupMenuItem(
                              child: Text(
                                "Mute",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                              value: 7,
                            ),
                            PopupMenuItem(
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                              value: 8,
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  height: 100,
                  child: SingleChildScrollView(
                    child: Container(
                      child:StreamBuilder(
                        stream: (widget.group==true)?FirebaseFirestore.instance.collection('message/${widget.userUid}/${widget.userName}').orderBy('timestamp',descending: true).snapshots():FirebaseFirestore.instance.collection('message/${_auth.currentUser!.uid}/${widget.userName}').orderBy('timestamp',descending: true).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                          if(!snapshot.hasData){
                            return CircularProgressIndicator();
                          }
                  return SizedBox(
                    height: 500,
                    child: new ListView(
                        children: snapshot.data!.docs.reversed.map((data) =>  ListTile(

                          title: Column(
                            crossAxisAlignment:(data['uid']==_auth.currentUser!.uid)? CrossAxisAlignment.end:CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment:(data['uid']==_auth.currentUser!.uid)?MainAxisAlignment.end :MainAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: (data['uid']==_auth.currentUser!.uid)?Border.all(color: Colors.white): Border.all(color: Color(0xfff2e7c2) ,width: 3),
                                            borderRadius: BorderRadius.circular(30)
                                        ),
                                        child:(data['uid']==_auth.currentUser!.uid)?null: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 5,color: Colors.white),
                                              borderRadius: BorderRadius.circular(50),
                                              image: DecorationImage(image: NetworkImage('${data['Image']}'),fit:BoxFit.cover)
                                          ),
                                        ),

                                      ),
                                    ),
                                  ),

                                  Container(

                                    margin: (data['uid']==_auth.currentUser!.uid)? EdgeInsets.only(left: 30):EdgeInsets.only(right: 30),
                                    padding: EdgeInsets.symmetric(vertical: 0,horizontal: 00),
                                      decoration: BoxDecoration(
                                        color:(data['uid']==_auth.currentUser!.uid)? Color(0xffefeff2):Color(0xfff1e6c1)
                                      ),
                                      child:  Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:(data['uid']==_auth.currentUser!.uid)?CrossAxisAlignment.end:CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Container(
                                                width: 175,
                                                child: Text(data['message'],style: TextStyle(
                                                  color: Color(0xff173051),
                                                  fontSize: 17
                                                ),),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.messenger,color:Color(0xff173051) ,),
                                                    Text('Translation',style: TextStyle(
                                                      color:Color(0xff173051),
                                                      fontSize: 12
                                                    ),),
                                                    SizedBox(width: 10,)
                                                  ],
                                                ),
                                                Text('11:00 pm',style: TextStyle(
                                                    color:Color(0xff173051),
                            fontSize: 12
                        ),)
                                              ],
                                            )
                                          ],
                                        ),
                                      )

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:(data['uid']!=_auth.currentUser!.uid)?Border.all(color: Colors.white): Border.all(color: Color(0xfff2e7c2) ,width: 3),
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                      child:(data['uid']!=_auth.currentUser!.uid)?null: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 5,color: Colors.white),
                                            borderRadius: BorderRadius.circular(50),
                                            image: DecorationImage(image: NetworkImage('${data['Image']}'),fit:BoxFit.cover)
                                        ),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                                  ),
                  ).toList()
                  ),
                  );
                             }
                             ) )

   )

                    ),
                  ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => BottomSheetFile());
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xff173051), shape: BoxShape.circle),
                        child: Icon(
                          Icons.attach_file_sharp,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: TextField(
                                    controller: _controller,
                                    maxLines: 8,
                                    onChanged: (value){
                                      message =value.trim();
                                      if(value.length>0){setState(() {
                                       iconStatus=true;
                                     });}
                                     else{
                                       setState(() {
                                         iconStatus=false;
                                       });
                                     }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Write a comment...',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              child: PopupMenuButton(
                                  elevation: 3.2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                  child: Center(
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color:Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Icon(Icons.more_horiz_outlined)),
                                  ),
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(Icons.timer_outlined),
                                              Text('Burn'),
                                            ],
                                          ),
                                          value: 1,
                                        ),
                                        PopupMenuItem(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(Icons
                                                  .local_fire_department),
                                              Text('Expire')
                                            ],
                                          ),
                                          value: 2,
                                        ),
                                      ],onSelected: (value){
                                    if(value==1){
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) => BottomSheetOne());
                                    }
                                    if(value==2){
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) => BottomSheetTwo());
                                    }
                              },

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async{
                        var timestamp=DateTime.now().millisecondsSinceEpoch;
                        var time=await TimeOfDay.now();
                        print(time);
                        print(widget.group);
                        if(widget.group!=true){
                          CollectionReference userslist = FirebaseFirestore.instance.collection('message');
                          userslist.doc(_auth.currentUser!.uid).collection('userList').doc(widget.userName)
                              .set({
                            'Name':widget.userName,
                            'Image':widget.myImage,
                            'uid':widget.userUid,
                            'status':widget.userStatus,
                            'group':'false',
                          });
                          print(widget.userUid);
                          print(_auth.currentUser!.uid);
                          userslist.doc(widget.userUid).collection('userList').doc(widget.myName).set({
                            'Name':widget.myName,
                            'Image':widget.myImage,
                            'uid':_auth.currentUser!.uid,
                            'status':widget.userStatus,
                            'group':'false',
                          });
                          CollectionReference users = FirebaseFirestore.instance.collection('message');
                          users.doc(_auth.currentUser!.uid).collection(widget.userName).doc().set({
                            'Name':widget.myName,
                            'Image':widget.myImage,
                            'message':message,
                            'uid':_auth.currentUser!.uid,
                            'group':'false',
                            'timestamp':timestamp,
                          });
                          users.doc(widget.userUid).collection(widget.myName).doc().set({
                            'Name':widget.myName,
                            'Image':widget.myImage,
                            'message':message,
                            'uid':_auth.currentUser!.uid,
                            'group':'false',
                            'timestamp':timestamp,

                          });
                          print(widget.userStatus);
                          print(_auth.currentUser!.uid);
                        }
                        else{
                          print(widget.userUid);
                          print(widget.userName);
                          print(widget.myName);
                          CollectionReference users = FirebaseFirestore.instance.collection('message');
                          users.doc('${widget.userUid}').collection(widget.userName).doc().set({
                            'Name':widget.myName,
                            'Image':widget.userImage,
                            'uid':_auth.currentUser!.uid,
                            'message':message,
                            'timestamp':timestamp,
                          });
                        }
                        _controller.clear();
                        iconStatus=false;},
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xffd4af36), shape: BoxShape.circle),
                        child: Icon( iconStatus?Icons.send:Icons.mic,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

