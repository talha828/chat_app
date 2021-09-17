import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {
  ListTiles({this.uid,this.image,this.name});
final name;
final image;
final uid;

  realTimeData()async{
    FirebaseAuth _auth=FirebaseAuth.instance;
    FirebaseDatabase database = FirebaseDatabase(
      databaseURL: 'https://multiapp-f0e1e-default-rtdb.europe-west1.firebasedatabase.app/',
    );
    database.reference().child(_auth.currentUser!.uid).child('user').set(
        {'uid':uid,
          'Name':name,
          'image':image,}).whenComplete(() =>print('done'));
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:()async{
        await  realTimeData();
      },
      leading: Stack(children: [
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Color(0xffFFF6EC7E), width: 3)),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover),
                color: Color(0xff173051),
                borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 30,
                width: 30,
              ),
            ),
          ),
        ),
      ]),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
