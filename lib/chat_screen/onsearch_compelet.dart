import 'dart:math';

import 'package:chat_app/chat_screen/chat_room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';

class Finder extends StatefulWidget {
 Finder({this.userName,this.userStatus,this.userImage,this.userUid});
 final userStatus;
  final userName;
  final userImage;
  final userUid;

  @override
  _FinderState createState() => _FinderState();
}

class _FinderState extends State<Finder> {
  String search='hh';
  late String uid;
  late String image;
  late String Names;
  late String userName;
  late String userImage;
  late String userUid;
  var myName;
  var myImage;
  List myList=[];
  onlineStatus()async{
    final myname =_auth.currentUser!.email;
    print(myname?.replaceAll('@gmail.com', ''));
    myName=myname?.replaceAll('@gmail.com', '');
    final myData = users.doc(_auth.currentUser!.uid).get() ;
    myImage =await myData.then((value) => value['image']);
    print(myImage);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onlineStatus();
  }
  FirebaseAuth _auth =FirebaseAuth.instance;

  start()async{
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('user')
        .limit(10)
        .where('First Name', isEqualTo: search)
        .get();

    List<QueryDocumentSnapshot> docs = snapshot.docs;
    for (var doc in docs) {
      if (doc.data() != null) {
        var data = doc.data() as Map<String, dynamic>;
        Names = data['First Name'];
        image =data['image'];
        uid= data['status'];
      }
    }
  }
  CollectionReference users = FirebaseFirestore.instance.collection('user');


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
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
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
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        height: 40,
                        child:TextField(
                          onChanged: (value)async{
                            search=value;
                          },
                          style: TextStyle(
                              color: Colors.white
                          ),
                          decoration: InputDecoration(
                              focusColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: InputBorder.none,
                              hintText: 'Search..',
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                              filled: true,
                              fillColor: Color(0xff3a4f6b),
                              suffixIcon: GestureDetector(
                                  onTap: ()async {
                                    await start();
                                  if(Names!=null&&image!=null){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Finder(userName: Names,userStatus: uid,userImage: image,)));
    }
                                    },
                                  child: Icon(Icons.search,color: Colors.white,size: 30,))
                          ),

                        ) ,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                      ),
                      child:ListView(
                        children: [ListTile(
                          onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(userName: widget.userName,userImage: widget.userImage,userStatus: widget.userStatus,userUid: widget.userUid,myName: myName,myImage: myImage,group: false,)));
                          },
                          leading: Stack(children: [
                                        Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              border: Border.all(color: Color(0xffFFF6EC7E), width: 3)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(image: NetworkImage(widget.userImage),fit: BoxFit.cover),
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
                                      ]),
                          title: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(widget.userName,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey[800],
                                                ),
                                              ),
                        ],
                      ),
                    ),

                    ]
                ),
              )
            ],
          ),
        ),
      ]),
    )
    )
    );
  }
}
