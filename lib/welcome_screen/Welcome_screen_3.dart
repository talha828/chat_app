
import 'package:chat_app/material/constan_file.dart';
import 'package:chat_app/user_sign_up/phone_number.dart';
import 'package:flutter/material.dart';

class HomePageOne3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Welcome to',
                        style: welcomeTo
                      ),
                      Text(
                        'MULTI APP',
                        style: multiApp
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.lightGreenAccent,
                    height: 350,
                    child: Image.asset('assets/ok1.jpeg',scale: 10,fit: BoxFit.cover,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        'Navigate to your destination',
                        style:welcomeScreenText
                      ),
                      Text(
                        'Without saving the history',
                        style:welcomeScreenText
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Keep private using our VPN',
                        style:welcomeScreenText
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                FloatingActionButton(
                    backgroundColor: Color(0xffd4af36),
                    child: Icon(Icons.arrow_forward_ios),
                    onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>PhoneNumber()));})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
