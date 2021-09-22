import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:gx_file_picker/gx_file_picker.dart';
class SafeImage extends StatefulWidget {

  @override
  _SafeImageState createState() => _SafeImageState();
}

class _SafeImageState extends State<SafeImage> {
  var imageName;
  var downloadLink;
  savePicture()async{
    File file = await FilePicker.getFile(
      type: FileType.image,
    ).catchError((e)=> print(e));
     // imageName=file.path;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: Text('Image Safe',style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor:Color(0xffbd58ce),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [

              Positioned(
                  bottom:20,
                  right: 10,
                  child: Container(child: FloatingActionButton(backgroundColor: Color(0xffbd58ce),onPressed: ()async{savePicture();},child: Icon(Icons.add),))),
            ],
          ),),
      ),
    );
  }
}
