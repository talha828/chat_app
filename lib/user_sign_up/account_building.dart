import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:chat_app/user_sign_up/phone_number.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:image_selector_formfield/image_selector_formfield.dart';
import 'package:chat_app/Button.dart';
import 'package:chat_app/material/constan_file.dart';
import 'package:chat_app/user_sign_up/phone_textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_mac/get_mac.dart';



class AccountMaking extends StatefulWidget {
  @override
  _AccountMakingState createState() => _AccountMakingState();
}

class _AccountMakingState extends State<AccountMaking> {
  FirebaseAuth _auth=FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  dynamic image = 'assets/user.png';
  bool check = false;
  late String userName;
  late String password;
  late String  passwordtwo;
 late String imageUrl;

  Future<void> addUser(image) async{
    //add image on fire base
    CollectionReference users = FirebaseFirestore.instance.collection('user');

    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child(_auth.currentUser!.uid);
  var uploadTask = ref.putFile(image);String downloadUrl = await (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
    // Call the user's CollectionReference to add a new user
    return users.doc(_auth.currentUser!.uid).set({ 'User id':  _auth.currentUser!.uid,
      'First Name': userName,
      'image':downloadUrl,
      'code':password,
      'status':true,
      'mute':false,
      'pin':false,
      'macAddress':_platformVersion
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  late List<String>mac=[];
  Future getDocs() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('user').get();
      var a = querySnapshot.docs.map((data) => data['macAddress']);
           for(var b in a){
             if(b==_platformVersion){
               mac.add(b);
               print(b);
               print(mac.length);
             }
           }

  }
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
    getDocs();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
      platformVersion = await GetMac.macAddress;


    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
    print(_platformVersion);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: 185,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border:
                      Border.all(width: 10, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  //TO DO PIC IS INCOMPLETE
                  child: ImageSelectorFormField(
                    cropStyle: CropStyle.circle,
                    icon: Icon(Icons.person_add_alt_1,size: 100,color: Color(0xFF303F9F) ,),
                    backgroundColor:  Colors.grey.withOpacity(0.5),
                    errorTextStyle: TextStyle(color: Colors.red),
                    onSaved: (img) {
                      print("ON SAVED EJECUTADO");
                      image=img;
                    },
                    onChanged: (img){
                   setState(() {
                     image=img;
                   });
                    },
                    cropRatioX: 9,
                    cropRatioY: 16,
                  ) ,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text('Account Details', style: phone),
                ),
                PhoneTextField(
                  text: 'User Name',
                  onChange: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                ),
                PhoneTextField(
                  text: 'Password',
                  onChange: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                PhoneTextField(
                  text: 'Confirm Password',
                  onChange: (value) {
                    setState(() {
                      passwordtwo = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  text: 'CONTINUE',
                  icon: Icons.arrow_forward_ios,
                  onPress: () async {
                    if(mac.length>2){
                      Alert(context: (context),
                        type: AlertType.error,
                        title: "you have already three account",
                        desc: 'sorry!! you can only make three account on this app',
                        buttons:[ DialogButton(
                          child: Text('Login',style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),),
                          onPressed: (){},
                        )]
                      ).show();
                    }
                    else{
                      if (userName !=null && password !=null && image !=null){
                        if(passwordtwo==password){
                          FirebaseAuth _auth=await  FirebaseAuth.instance;
                          _auth.createUserWithEmailAndPassword(email: '$userName@gmail.com', password: password).whenComplete(() {
                            addUser(image);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneNumber(name: userName,)));}).catchError((e)=> print(e));
                        }
                        else{
                          Alert(
                            context: context,
                            type: AlertType.error,
                            title: "Check Password",
                            desc: "Password are not match",
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
                        }
                      }

                      else {
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
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}