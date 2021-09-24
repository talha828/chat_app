import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:gx_file_picker/gx_file_picker.dart';
import 'package:flt_video_player/flt_video_player.dart';




class SafeImage extends StatefulWidget {

  @override
  _SafeImageState createState() => _SafeImageState();
}

class _SafeImageState extends State<SafeImage> {
  var imageName;
  var downloadLink;
  FirebaseAuth _auth=FirebaseAuth.instance;

  savePicture()async{
    File file = await FilePicker.getFile(
      type: FileType.image,
    ).catchError((e)=> print('error'));
    imageName=file.path;
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child('${_auth.currentUser!.uid}').child(imageName);
    var uploadTask = ref.putFile(file); downloadLink = await (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
    print(downloadLink);
    CollectionReference users = FirebaseFirestore.instance.collection('message');
    users.doc(_auth.currentUser!.uid).collection('Image').doc().set({
      'uid':downloadLink,
    });

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
              Container(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('message/${_auth.currentUser!.uid}/Image').snapshots(),
                  builder:(context,AsyncSnapshot<QuerySnapshot> snapshot){
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }
                    return ListView(
                      children: snapshot.data!.docs.map((data) => ListTile(
                        onTap: ()async{
                        },
                        title: Image.network(data['uid']),

                      )).toList(),
                    );
                  } ,
                ),
              ),
              Positioned(
                  bottom:100,
                  right: 10,
                  child: Container(child: FloatingActionButton(backgroundColor: Color(0xffbd58ce),onPressed: ()async{savePicture();},child: Icon(Icons.add),))),
            ],
          ),),
      ),
    );
  }
}


class SafeMedia extends StatefulWidget {

  @override
  _SafeMediaState createState() => _SafeMediaState();
}

class _SafeMediaState extends State<SafeMedia> {
  var imageName;
  var downloadLink;
  var path;
  var link;
late  VideoPlayerController _controller=VideoPlayerController.path(link.toString());
  FirebaseAuth _auth=FirebaseAuth.instance;

  savePicture()async{
    print(_auth.currentUser!.uid);
    File file = await FilePicker.getFile(
      type: FileType.video,
    ).catchError((e)=> print('error'));
     imageName=file.path;
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child('${_auth.currentUser!.uid}').child(imageName);
    var uploadTask = ref.putFile(file); downloadLink = await (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
print(downloadLink);
    CollectionReference users = FirebaseFirestore.instance.collection('message');
    users.doc(_auth.currentUser!.uid).collection('Video').doc().set({
      'uid':downloadLink,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: Text('Video Safe',style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor:Color(0xfff78e0e),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('message/${_auth.currentUser!.uid}/Video').snapshots(),
                  builder:(context,AsyncSnapshot<QuerySnapshot> snapshot){
                    path=snapshot.data!.docs.map((e) => e['uid']);
                    for(var a in path){
                       link=a;
                    }
                    print(_auth.currentUser!.uid);
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }
                    return ListView(
                      children: snapshot.data!.docs.map((data) => ListTile(
                        title:VideoPlayer(VideoPlayerController.path(link))

                      )).toList(),
                    );
                  } ,
                ),
              ),
              Positioned(
                  bottom:100,
                  right: 10,
                  child: Container(child: FloatingActionButton(backgroundColor: Color(0xffbd58ce),onPressed: ()async{savePicture();},child: Icon(Icons.add),))),
            ],
          ),),
      ),
    );
  }
}
