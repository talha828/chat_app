import 'package:chat_app/welcome_screen/Welcome_screen_3.dart';
import 'package:chat_app/material/constan_file.dart';
import 'package:flutter/material.dart';

class HomePageOne2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text('Welcome to',style:welcomeTo),
                      Text('MULTI APP',style: multiApp,),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Image.asset('assets/ok2.jpeg')),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text('Exchange, send and receive ',style: welcomeScreenText),
                      Text('Cryptocurrencies in your wallet ',style: welcomeScreenText),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                FloatingActionButton(
                    backgroundColor: Color(0xffd4af36),
                    child: Icon(
                        Icons.arrow_forward_ios
                    ),
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageOne3()));})
              ],
            ),
          ),
        ),
      ),
    );
  }
}