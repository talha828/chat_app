// @dart=2.9

import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:chat_app/group_search.dart';
import 'package:chat_app/user_sign_up/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app_check/firebase_app_check.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await  Firebase.initializeApp();
 FirebaseAuth.instance;
 FirebaseAppCheck.instance.activate();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body:ChatScreen(),
      ),
    );
  }
}



