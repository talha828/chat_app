import 'package:chat_app/chat_screen/chat_room.dart';
import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:chat_app/chat_screen/selected_row.dart';
import 'package:flutter/material.dart';
bool selection= false;
class ChatText extends StatelessWidget {
  ChatText({this.text,this.image,this.time});
  final text;
  final image;
  final time;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: Colors.green,
                width: 2,
              ),
            ),
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                BorderRadius.all(Radius.circular(50.0)),
                border: Border.all(
                    width: 5.0,
                    color: Colors.white
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
            child: Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width/1.5,
              decoration:BoxDecoration(
                  color: Color(0xffefeff2),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Text(text,style: TextStyle(
                        fontSize: 20
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(child: Row(
                          children: [
                            Icon(Icons.messenger,size: 13,),
                            SizedBox(width: 5,),
                            Text('Translation',style: TextStyle(
                                fontSize: 12
                            ),),
                          ],
                        ),
                        ),
                        Text(time,style: TextStyle(
                            fontSize: 10
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatImage extends StatefulWidget {
  ChatImage({this.image2,this.image1,this.name});
  final image1;
  final image2;
  final name;

  @override
  _ChatImageState createState() => _ChatImageState();
}
class _ChatImageState extends State<ChatImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onLongPress: (){
      setState(() {
        selection=selection?false:true;
      });
      selection? Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectedRow(image: widget.image1,name: widget.name,))):Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(userName: widget.name,userImage: widget.image1,)));

    },
      child: Container(
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
              child: Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width/1.5,
                decoration:BoxDecoration(
                    color: selection?Color(0xff173051):Color(0xfff1e6c1),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                    )
                ),
                child: Image.network(widget.image1),),
            ),
            Container(
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(50.0)),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.image1),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                  BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                      width: 3.0,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 class MyText extends StatelessWidget {
  MyText({this.myimage,this.mytext,this.time});
  final myimage;
  final time;
  final mytext;
   @override
   Widget build(BuildContext context) {
     return Container(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
             child: Container(
               margin: EdgeInsets.all(10),
               width: MediaQuery.of(context).size.width/1.5,
               decoration:BoxDecoration(
                   color: Color(0xfff1e6c1),
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                       bottomRight: Radius.circular(10),
                       bottomLeft: Radius.circular(10)
                   )
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                     child: Text(mytext,style: TextStyle(
                         fontSize: 20
                     ),),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(child: Row(
                           children: [
                             Icon(Icons.messenger,size: 13,),
                             SizedBox(width: 5,),
                             Text('Translation',style: TextStyle(
                                 fontSize: 12
                             ),),
                           ],
                         ),
                         ),
                         Text(time,style: TextStyle(
                             fontSize: 10
                         ),)
                       ],
                     ),
                   )
                 ],
               ),),
           ),
           Container(
             width: 55.0,
             height: 55.0,
             decoration: BoxDecoration(
               borderRadius:
               BorderRadius.all(Radius.circular(50.0)),
               border: Border.all(
                 color: Colors.grey,
                 width: 2,
               ),
             ),
             child: Container(
               width: 50.0,
               height: 50.0,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: NetworkImage(myimage),
                   fit: BoxFit.cover,
                 ),
                 borderRadius:
                 BorderRadius.all(Radius.circular(50.0)),
                 border: Border.all(
                     width: 5.0,
                     color: Colors.white
                 ),
               ),
             ),
           ),
         ],
       ),
     );
   }
 }

