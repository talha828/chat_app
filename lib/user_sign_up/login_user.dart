import 'package:chat_app/Button.dart';
import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:chat_app/user_sign_up/account_building.dart';
import 'package:chat_app/user_sign_up/phone_textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../chat_screen/list_tile.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String code;
  late String name;
  List myList=[];List<Widget> chatList=[];

  // getData(){
  //   FirebaseDatabase database = FirebaseDatabase(
  //     databaseURL: 'https://multiapp-f0e1e-default-rtdb.europe-west1.firebasedatabase.app/',
  //   );
  //   FirebaseAuth _auth= FirebaseAuth.instance;
  //   final db =database.reference().child(_auth.currentUser!.uid).child('userID');
  //   db.once().then((DataSnapshot snapshot){
  //     Map<dynamic, dynamic> map = snapshot.value;
  //     map.forEach((key,values) {
  //       print(values);
  //       myList.add(values);
  //       start(values);
  //     });
  //     // ignore: invalid_return_type_for_catch_error
  //   }).catchError((e)=>print(e));
  // }
  // start(search)async{
  //   QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
  //       .collection('user')
  //       .limit(10)
  //       .where('User id', isEqualTo: search)
  //       .get();
  //
  //   List<QueryDocumentSnapshot> docs = snapshot.docs;
  //   for (var doc in docs) {
  //
  //     if (doc.data() != null) {
  //       var data = doc.data() as Map<String, dynamic>;
  //       var Names = data['First Name'];
  //       var image =data['image'];
  //       Widget title = SingleChat(image: image,title: Names,pin: null,mute: null,subtitle: 'talha',time: '11:00',color: Colors.green,);
  //       setState(() {
  //         chatList.add(title);
  //       });
  //
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Image.asset('assets/backgroung_logo.jpg',scale: 10,),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PhoneTextField(
                    text: 'User Name',
                    onChange: (value){
                      setState(() {
                        name=value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PhoneTextField(
                    text: 'Password',
                    onChange: (value){
                      setState(() {
                        code=value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(text: 'Login',icon: Icons.arrow_forward,onPress: ()async{
                    FirebaseAuth _auth=FirebaseAuth.instance;
                    _auth.signInWithEmailAndPassword(email: '$name@gmail.com', password:code).whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen())),);})),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
