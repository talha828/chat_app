import 'dart:async';
import 'package:chat_app/user_sign_up/account_building.dart';
import 'package:chat_app/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
   Timer(Duration(seconds: 5),(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountMaking()));});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/backgroung_logo.jpg',fit: BoxFit.cover,)
          ],
        ),
      ),
    );
  }
}