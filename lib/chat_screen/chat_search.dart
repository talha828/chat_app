import 'package:chat_app/chat_screen/onsearch_compelet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ChatSearch extends StatefulWidget {
  @override
  _ChatSearchState createState() => _ChatSearchState();
}

class _ChatSearchState extends State<ChatSearch> {
  late String image;
    String search='hh';
late String name;
late String myName;
    bool talha=false;
    var data;
    late bool status;
   late String uid;
  FirebaseAuth _auth=FirebaseAuth.instance;

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
         name = data['First Name'];
         image =data['image'];
         status= data['status'];
         uid=data['User id'];
       }
     }
     QuerySnapshot<Map<String, dynamic>> snapshots = await FirebaseFirestore.instance
         .collection('user')
         .limit(10)
         .where('User id', isEqualTo: _auth.currentUser!.uid)
         .get();

     List<QueryDocumentSnapshot> docss = snapshots.docs;
     for (var doc in docss) {
       if (doc.data() != null) {
         var data = doc.data() as Map<String, dynamic>;
         myName = data['First Name'];
       }
     }
   }
 // SearchFriend(){
 //   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('user').snapshots();
 //    return StreamBuilder(
 //      stream: _usersStream,
 //      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
 //        if (snapshot.hasError) {return Text('Something went wrong');}
 //
 //        if (snapshot.connectionState == ConnectionState.waiting) {return Text("Loading");
 //        }
 //
 //        return ListView(
 //          children: snapshot.data!.docs.map((DocumentSnapshot document) {
 //            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
 //            final pic = data['User id'];
 //            String name=data['First Name'];
 //            if(name==search){
 //              setState(() {
 //                talha=true;
 //                Name=name;
 //              });
 //            }
 //            String ima =  pixLe(pic).toString();
 //             return ListTile(
 //               leading: Stack(children: [
 //                 Container(
 //                   padding: EdgeInsets.all(3),
 //                   decoration: BoxDecoration(
 //                       borderRadius: BorderRadius.circular(100),
 //                       border: Border.all(color: Color(0xffFFF6EC7E), width: 3)),
 //                   child: Container(
 //                     decoration: BoxDecoration(
 //                         image: DecorationImage(image: NetworkImage(ima),fit: BoxFit.cover),
 //                         color: Color(0xff173051),
 //                         borderRadius: BorderRadius.circular(100)),
 //                     child: Padding(
 //                       padding: const EdgeInsets.all(8.0),
 //                       child: SizedBox(
 //                         height: 30,
 //                         width: 30,
 //                       ),
 //                     ),
 //                   ),
 //                 ),
 //               ]),
 //               title: Row(
 //                 mainAxisAlignment: MainAxisAlignment.start,
 //                 children: [
 //                   Text('${data['First Name']}',
 //                     style: TextStyle(
 //                       fontSize: 20,
 //                       color: Colors.grey[800],
 //                     ),
 //                   ),
 //                   Container(child: null,),
 //                   Container(child: null,),
 //                 ],
 //               ),
 //               onTap: (){
 //                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(name: title,image: image,)));
 //               },
 //             );
 //            // print(pic);
 //            //       start(pic);
 //            // return ListTile(
 //            //   trailing: Container(
 //            //     width: 200,
 //            //     height: 200,
 //            //     // child: Image.network(image)),),
 //            //   ),
 //            //   title: Text('${data['First Name']}'+' '+'${data['Last Name']}'),
 //            //   subtitle: Text(data['Country']),
 //            // );
 //          }).toList(),
 //      );
 //      },
 //
 //    );
 //  }
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
                                onTap: ()async{
                                  await  start();
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Finder(userName: name,userStatus: status,userImage: image,userUid: uid,)));
                                  },                            child: Icon(Icons.search,color: Colors.white,size: 30,))
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
                      child: null,
                    ),

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
