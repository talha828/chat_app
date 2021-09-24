import 'package:chat_app/add_group_user.dart';
import 'package:chat_app/chat_screen/chat_room.dart';
import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:chat_app/group_chat.dart';
import 'package:chat_app/group_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_item/multi_select_item.dart';


class GroupSearch extends StatefulWidget {
  GroupSearch({this.groupName,this.imageLink});
  final groupName;
  final imageLink;
  @override
  _GroupSearchState createState() => _GroupSearchState();
}

class _GroupSearchState extends State<GroupSearch> {
  late String image;
  String search='hh';
  MultiSelectController controller = new MultiSelectController();
  late String name;
  late String myName;
  bool talha=true;
  var data;
  late bool status=true;
  late String uid;
  FirebaseAuth _auth=FirebaseAuth.instance;

  start()async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('user')
        .limit(10)
        .where('First Name', isEqualTo: search)
        .get();

    List<QueryDocumentSnapshot> docs = snapshot.docs;
    for (var doc in docs) {
      if (doc.data() != null) {
        var data = doc.data() as Map<String, dynamic>;
        name = data['First Name'];
        image = data['image'];
        status = data['status'];
        uid = data['User id'];
      }
    }
    QuerySnapshot<Map<String, dynamic>> snapshots = await FirebaseFirestore
        .instance
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
                        decoration:arrowIcon,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child:Text('Add Group Member',style: TextStyle(
                         color: Colors.white,
                          fontSize: 24
                        ),)
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration:arrowIcon,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [Container(
                      padding: EdgeInsets.all(10),
                      decoration:boxRadius,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('message/${_auth.currentUser!.uid}/userList').snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if(!snapshot.hasData){
                              return CircularProgressIndicator();
                            }
                            return Container(
                              color:talha?Colors.white:Colors.blue,
                              child: SizedBox(
                                height: 600,
                                child:  ListView(
                                    children: snapshot.data!.docs.reversed.map((data) =>  Padding(
                                      padding:const EdgeInsets.all(8.0),
                                      child: (data['group']==false)? null:ListTile(
                                   onTap: ()async{
                                       CollectionReference users = FirebaseFirestore.instance.collection('message/${_auth.currentUser!.uid}/userList');
                                              users.doc(data['Name']).update(
                                                  {'group':(data['group']==true)?false:true});
                                       users.doc(widget.groupName).set({
                                         'uid':_auth.currentUser!.uid,
                                         'status':true,
                                         'Image':widget.imageLink,
                                         'Name':widget.groupName,
                                         'mute':false,
                                         'pin':false,
                                         'group':true,
                                       });
                                       CollectionReference userss = FirebaseFirestore.instance.collection('message/${data['uid']}/userList');
                                       userss.doc(widget.groupName).set({
                                         'uid':_auth.currentUser!.uid,
                                         'status':true,
                                         'Image':widget.imageLink,
                                         'Name':widget.groupName,
                                         'mute':false,
                                         'pin':false,
                                         'group':true,
                                       });

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
                                                      image: DecorationImage(image: NetworkImage('${data['Image']}'),fit:BoxFit.cover)
                                                  ),
                                                ),

                                              ),
                                              Positioned(bottom: 5,
                                                right: 1,
                                                child: CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor: Colors.white,
                                                  child: CircleAvatar(
                                                    radius: 8,
                                                    backgroundColor:(data['group']==true)? Colors.blue:Color(0xff52cc56),
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
                                        trailing: Text('11:00'),

                                      ),
                                    ),).toList()),
                              ),
                            );
                          }
                      ),
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
