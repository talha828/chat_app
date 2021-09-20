import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_mac/get_mac.dart';

class SwitchAccount extends StatefulWidget {

  @override
  _SwitchAccountState createState() => _SwitchAccountState();
}

class _SwitchAccountState extends State<SwitchAccount> {
  String _platformVersion = 'Unknown';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(padding: EdgeInsets.symmetric(vertical: 200),
            margin: EdgeInsets.all(10),
            child: StreamBuilder(
              stream:FirebaseFirestore.instance.collection('user').snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }
                return ListView(
                  children: snapshot.data!.docs.map((data) =>Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black26,width: 1)
                      )
                    ),
                    child:(_platformVersion==data['macAddress'])? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: (){
                          FirebaseAuth _auth= FirebaseAuth.instance;
                          _auth.signInWithEmailAndPassword(email: '${data['First Name']}@gmail.com', password:data['code']).whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen())));
                        },
                        leading:  Stack(children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: Color(0xffFFF6EC7E), width: 3)),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(data['image']),fit: BoxFit.cover),
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
                            Text(data['First Name'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ):null,
                  ) ).toList(),
                );
              }
              ,
            ),
          ),
        ),
      ),
    );
  }
}
