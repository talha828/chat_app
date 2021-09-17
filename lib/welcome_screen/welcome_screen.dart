import 'package:chat_app/material/constan_file.dart';
import 'package:chat_app/welcome_screen/welcome_screen_2.dart';
import 'package:flutter/material.dart';

class HomePageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text('Welcome to',style: welcomeTo),
                      Text('MULTI APP',style: multiApp),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Image.asset('assets/ok3.jpeg')),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text('Chat with your friend in an',style:welcomeScreenText,),
                      Text('End To End Encryption App',style:welcomeScreenText),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                FloatingActionButton(
                    backgroundColor: Color(0xffd4af36),
                    child: Icon(
                        Icons.arrow_forward_ios
                    ),
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageOne2()));})
              ],
            ),
          ),
        ),
      ),
    );
  }
}


