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
                    _auth.signInWithEmailAndPassword(email: '$name@gmail.com', password:code).then((e) => Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen())),);})),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
