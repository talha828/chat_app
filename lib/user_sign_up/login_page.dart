import 'package:chat_app/Button.dart';
import 'package:chat_app/user_sign_up/account_building.dart';
import 'package:flutter/material.dart';

import 'login_user.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          body: Container(
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
                  child: Button(text: 'Sign UP',icon: Icons.arrow_forward,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountMaking()));},),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(text: 'Login',icon: Icons.arrow_forward,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));}),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
