import 'package:chat_app/chat_screen/chat_room.dart';
import 'package:flutter/material.dart';

final List<Widget> items = [


];

class SingleChat extends StatelessWidget {
  SingleChat({this.image,this.title,this.mute,this.pin,this.subtitle,this.time,this.color,});
  final image;
  final title;
  final subtitle;
  final mute;
  final pin;
  final time;
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom:BorderSide(color: Colors.grey.shade300 ,width: 2))
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
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
            Positioned(
                bottom: 5,
                right: 0,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: color,
                ))
          ]),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[800],
                ),
              ),
             Container(child: mute,),
           Container(child: pin,),
            ],
          ),
          trailing: Container(
            child:  Text(
              time,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
          ),
          subtitle: Text(subtitle),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(userName: title,userImage: image,)));
          },
        ),
      ),
    ); 
  }
}


class GroupChat extends StatelessWidget{
  GroupChat({this.image,this.title,this.mute,this.pin,this.subtitle,this.time,this.color});
  final image;
  final title;
  final subtitle;
  final mute;
  final pin;
  final time;
  final color;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          border: Border(bottom:BorderSide(color: Colors.grey.shade300 ,width: 2))
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Stack(children: [
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: color, width: 3)),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image)),
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
          title: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[800],
                  ),
                ),
               Container(child: mute,),
                Container(child: pin,)
              ],
            ),
          ),
          trailing: Container(
            child:  Text(
              time,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
          ),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}

final pinn=   Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10),
  child: ImageIcon(
    AssetImage('assets/pin.png'),
    color: Colors.grey,
    size: 15,
  ),
);

final mutee = Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5),
  child: ImageIcon(
    AssetImage('assets/mute.png'),
    color: Colors.grey,
    size: 15,
  ),
);

