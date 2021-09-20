import 'package:chat_app/Button.dart';
import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:chat_app/user_sign_up/account_building.dart';
import 'package:chat_app/material/constan_file.dart';
import 'package:chat_app/user_sign_up/phone_number.dart';
import 'package:chat_app/user_sign_up/pin_code_field.dart';
import 'package:chat_app/user_sign_up/security_code.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class Verification extends StatefulWidget {
  Verification({this.verificationId,this.country,this.name,this.number});
  final verificationId;
  final country;
  final name;
 final number;

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  late final code;
  TextEditingController _codeController = TextEditingController();
  FirebaseAuth _auth= FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  Future<void> addUser() {
    CollectionReference users = FirebaseFirestore.instance.collection('user');
    // Call the user's CollectionReference to add a new user
    return users.doc(_auth.currentUser!.uid).update({
      'Country':widget.country,
      'Number':widget.number
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('Verification Code', style: phone),
            ),
            Container(
              child: Text('Please enter Code that was', style: discription),
            ),
            Container(
              child: Text('sent to Phone Number', style: discription),
            ),
            PinField(
              result: _codeController,
            ),
            SizedBox(
              height: 40,
            ),
            Button(
              text: 'VERIFY',
              icon: Icons.arrow_forward_ios,
              onPress: () async{

                FirebaseAuth auth = FirebaseAuth.instance;

                var smsCode = _codeController.text.trim();

                var _credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: smsCode);
                auth.signInWithCredential(_credential).then((value) {
                  addUser();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>ChatScreen()));
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhoneNumber()));
              },
              child: Container(
                child: Text(
                  'Resend Code',
                  style: TextStyle(color: Color(0xffd4af36), fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
