import 'package:chat_app/group_search.dart';
import 'package:chat_app/material/constan_file.dart';
import 'package:chat_app/user_sign_up/phone_textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_selector_formfield/image_selector_formfield.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'Button.dart';

class GroupInfo extends StatefulWidget {

  @override
  _GroupInfoState createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  late String groupName;
  dynamic image = 'assets/user.png';
  late String imageLink='';
  FirebaseAuth _auth=FirebaseAuth.instance;
  GroupDetails()async{
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child(_auth.currentUser!.uid);
    var uploadTask = ref.putFile(image);imageLink = await (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
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
                    cropRatioX: 9,
                    cropRatioY: 16,
                  ) ,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text('Group Details', style: phone),
                ),
                PhoneTextField(
                  text: 'Group Name',
                  onChange: (value) {
                    setState(() {
                      groupName= value;
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
                      if(imageLink!=null&&groupName!=null){
                        await GroupDetails();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>GroupSearch(groupName: groupName,imageLink: imageLink,)));
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
