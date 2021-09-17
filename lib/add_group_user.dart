
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'group_chat.dart';

class AddGroupMember extends StatefulWidget {
  AddGroupMember({this.userName,this.status,this.userImage,this.myName,this.uid,this.groupName});
  final status;
  final userName;
  final userImage;
  final myName;
  final uid;
  final groupName;
  @override
  _AddGroupMemberState createState() => _AddGroupMemberState();
}

class _AddGroupMemberState extends State<AddGroupMember> {
  late String search;
  late String uid;
  late String image;
  late String names;
  late String userName;
  late String userImage;
  late String userUid;
  List myList=[];
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
        names = data['First Name'];
        image =data['image'];
        uid= data['status'];
      }
    }
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
                                          if(names!=null&&image!=null){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddGroupMember(userName: names,status: uid,userImage: image,)));
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
                                  CollectionReference users = FirebaseFirestore.instance.collection('${_auth.currentUser!.uid}/names/userName');
                                  users.doc().set({
                                    'userName':widget.groupName,
                                    'image':'data:image/jpeg;base64,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',
                                    'status':true,
                                    'uid':widget.uid
                                  });
                                  CollectionReference userschat = FirebaseFirestore
                                      .instance.collection(widget.uid);
                                  userschat.doc('names').collection('userName')
                                      .doc()
                                      .set({
                                    'userName':widget.groupName,
                                    'image':'data:image/jpeg;base64,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',
                                    'status':true,
                                    'uid':widget.uid

                                  });
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> GroupChat(name: widget.userName,image:widget.userImage,status: widget.status,groupName: widget,uid: widget.uid,myname:'talha',)));
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
