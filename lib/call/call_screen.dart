import 'package:chat_app/call/listTile_call.dart';
import 'package:chat_app/call/video_screen.dart';
import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:meet_hour/feature_flag/feature_flag.dart';
import "package:meet_hour/meet_hour.dart";

class Calling extends StatefulWidget {
  Calling({this.name,this.image,});
final name;
final image;

  @override
  _CallingState createState() => _CallingState();
}

class _CallingState extends State<Calling> {
  _joinMeeting() async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p

      var options = MeetHourMeetingOptions(room: 'talha');
        // Required, spaces will be trimmed
      print(widget.name);
      options.subject = "Call";
        options.userDisplayName = widget.name;
        options.userEmail = '${widget.name}@gmail.com';
        options.userAvatarURL = widget.image;// or .png;
        options.audioOnly = true;
        options.audioMuted = true;
        options.videoMuted = true;
        featureFlag = featureFlag;
           print('done');
      await MeetHour.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
      print('lose');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _joinMeeting();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xff173051),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 12),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffd4af36), shape: BoxShape.circle),
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xff173051),                  ),
                          ),
                        ),
                        Expanded(child: Container(alignment: Alignment.center, child: Text('Call',style: TextStyle(
                          color:Colors.white,
                          fontSize: 20
                        ),),)),
                        Container(child:ImageIcon(AssetImage('assets/search_icon.png'),color: Colors.white,size: 35,) ,),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Stack(
                      children:[ Container(
                          decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                        child:ListView(
                          children: [
                            ListTileOfCall(name: 'Alina',image: 'assets/bala1.jpg',day: 'Today',time: '11:00 PM',icon: Icons.phone,),
                            ListTileOfCall(name: 'Saba',image: 'assets/bala2.jpg',day: 'Today',time: '12:33 PM',icon: Icons.videocam,)

                          ],
                        )),
                      Positioned(
                          bottom: 40,
                          right: 10,
                          child: FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoCallScreen()));},child: Icon(Icons.add_ic_call_outlined),backgroundColor:Color(0xff173051),))
                      ]
                    ))
              ],
            ) ,
          ),
        ),
      ),
    );
  }
}
