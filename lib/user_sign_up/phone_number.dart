
import 'package:chat_app/Button.dart';
import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:chat_app/material/constan_file.dart';
import 'package:chat_app/material/display_icon.dart';
import 'package:chat_app/user_sign_up/phone_textField.dart';
import 'package:chat_app/user_sign_up/security_code.dart';
import 'package:chat_app/user_sign_up/verification_code.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
class PhoneNumber extends StatefulWidget {
PhoneNumber({this.name});
final name;


  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  late String country;

  late String number;
  Future register(String phone) async {
    FirebaseAuth _auth=FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential){
          _auth.signInWithCredential(credential).then((value){Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));});
        },
        verificationFailed: (authException){
          print(authException.message);
          print('hello robort');
        },
        codeSent: (String verificationId, [int? forceResendingToken]){
          //show dialog to take input from the user
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Verification(verificationId:verificationId,
                country: country,
                name: widget.name,
                number: number,
              )
          );
        },
        codeAutoRetrievalTimeout:(String verificationId){
          verificationId = verificationId;
          print(verificationId);
          print("Timout");
        });
  }
  Future<void> addUser() {
    FirebaseAuth _auth= FirebaseAuth.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('user');
    // Call the user's CollectionReference to add a new user
    return users.doc(_auth.currentUser!.uid).update({
      'Country':country,
      'Number':number
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Color(0xffd4af36), fontSize: 20),
                      ),
                    ),
                  ),
                ],),
             Display(imageName: 'assets/lock.png',),
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  child: Text('Phone Number',style: phone),),
                SizedBox(height: 10,),
                Text('Please type your Phone',style: discription),
                Text('Number and Country',style: discription),
                SizedBox(height: 10,),
               PhoneTextField(text: 'Country',onChange: (value){
                 setState(() {
                   country=value;
                 });
               },),
               PhoneTextField(text: '+01 - Number',onChange: (value){
                 setState(() {
                   number=value.trim();
                 });
               },),
                SizedBox(height: 20,),
              Button(text: 'CONTINUE',icon: Icons.arrow_forward_ios,onPress:  (){if (country !=null && number != null) {
                        register(number);
                        addUser();
              } else {
                Alert(
                  context: context,
                  type: AlertType.error,
                  title: "Some things wants wrong",
                  desc: "Please fill your credential",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Cancel",
                        style:
                        TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                ).show();
              }},),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
