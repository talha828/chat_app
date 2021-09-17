import 'package:chat_app/bottom_sheet/bottom_sheet.dart';
import 'package:chat_app/call/call_screen.dart';
import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:chat_app/group_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class GroupChat extends StatefulWidget {
  GroupChat({this.name, this.image,this.status,this.uid,this.myname,this.groupName});
  final name;
  final image;
  final status;
  final uid;
  final myname;
  final groupName;
  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  String Want='BTC';
  bool iconStatus=false;
  late String message;
  TextEditingController _controller =TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  bool sendByMe=true;


  @override
  void initState() {

    super.initState();
    CollectionReference users = FirebaseFirestore.instance.collection('user');
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
                                  image: AssetImage('backgroung_logo.jpg'),
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
                            widget.groupName,
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
                              color:widget.status?Color(0xFF61AC3C):Colors.grey,
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
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GroupSearch(groupName: widget.groupName,)));
                                },
                                child: Text(
                                  "add user",
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
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Calling(image: widget.image,name: widget.name,)));
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 100,
                    child: SingleChildScrollView(
                        child: Container(
                            child:null)

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
                        var timestamp = DateTime.now();
                        CollectionReference users = FirebaseFirestore.instance.collection('${_auth.currentUser!.uid}/names/${widget.groupName}');
    await    users.doc().set({
      'uid':_auth.currentUser!.uid,
      'name':widget.myname,
      'image':widget.image,
      'status':widget.status,
      'message':message.trim(),
      'timestamp':timestamp.millisecondsSinceEpoch,
    });
    CollectionReference userschat = FirebaseFirestore
        .instance.collection(widget.uid);
    userschat.doc('names').collection(widget.groupName)
        .doc()
        .set({
      'uid':_auth.currentUser!.uid,
      'name':widget.myname,
      'image':widget.image,
      'status':widget.status,
      'message':message.trim(),
      'timestamp':timestamp.millisecondsSinceEpoch,
    });
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

