import 'package:chat_app/Button.dart';
import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:chat_app/material/constan_file.dart';
import 'package:chat_app/material/display_icon.dart';
import 'package:chat_app/user_sign_up/phone_textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


 class SecurityCode extends StatefulWidget {

   SecurityCode({this.firstName,this.secondName,this.country,this.image});
final firstName;
final secondName;
final country;
final image;
   @override
   _SecurityCodeState createState() => _SecurityCodeState();
 }

 class _SecurityCodeState extends State<SecurityCode> {

  late String  code;
  FirebaseAuth _auth= FirebaseAuth.instance;

  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser() {
    //add image on fire base
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('usre')
        .child('profile')
        .child(_auth.currentUser!.uid);
    ref.putFile(widget.image);
    // Call the user's CollectionReference to add a new user
    return users.add({
      'User id':  _auth.currentUser!.uid,
      'First Name': widget.firstName, // John Doe
    'Last Name': widget.secondName, // Stokes and Sons
    'Country': widget.country,
      'code':code,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  
  }

   firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;


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
                 Display(imageName: 'assets/lock.png',),
                 SizedBox(height: 20,),
                 Container(
                   alignment: Alignment.center,
                   child: Text('Security Code',style:phone),),
                 SizedBox(height: 20,),
                 Text('Create a Security Code',style: discription),
                 Text('This code will be request',style: discription),
                 Text('Every time you sign in',style: discription),
                 SizedBox(height: 40,),
                 PhoneTextField(text: 'Code',onChange: (value){
                   code=value;
                   },),
                 SizedBox(height: 20,),
                Button(text: 'FINISH',icon: Icons.arrow_forward_ios,onPress: ()async{
                       await addUser();

                       Navigator.push(context, MaterialPageRoute(builder:(context)=>ChatScreen()));
                },)
               ],
             ),
           ),
         ),
       ),
     );
   }
 }
