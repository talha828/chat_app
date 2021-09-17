import 'package:chat_app/bottom_sheet/bottom_sheet.dart';
import 'package:chat_app/chat_screen/chat_room.dart';
import 'package:chat_app/chat_screen/chat_text.dart';
import 'package:flutter/material.dart';

class SelectedRow extends StatefulWidget {
  SelectedRow({this.image,this.name,});
  final image;
  final name;
  @override
  _SelectedRowState createState() => _SelectedRowState();
}

class _SelectedRowState extends State<SelectedRow> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topRight,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xff173051),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              selection=selection?false:true;
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(userName: widget.name,userImage: widget.image,)));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffd4af36), shape: BoxShape.circle),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text('1',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),),
                        IconButton(onPressed: (){}, icon:Icon(Icons.reply,color: Colors.white,size: 30,)),
                        ImageIcon(AssetImage('assets/box.png'),color: Colors.white,size: 30,),
                        IconButton(onPressed: (){}, icon:Icon(Icons.delete,color: Colors.white,size: 30,),),
                        ImageIcon(AssetImage('assets/forward.png'),color: Colors.white,size: 24,),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 100,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ChatText(
                            text: 'how are you',
                            image: widget.image,
                            time: '11:00',
                          ),
                          MyText(
                            myimage: 'assets/bala2.jpg',
                            time: '11:01',
                            mytext: 'fine what about you',
                          ),
                          ChatText(
                            text: 'can you send your profile pics',
                            image: widget.image,
                            time: '11:00',
                          ),
                          ChatImage(
                            image1: 'assets/bala1.jpg',
                            image2: 'assets/bala1.jpg',
                            name: widget.name,
                          ),
                          ChatText(
                            text: 'nice pic dear',
                            image: widget.image,
                            time: '11:00',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => BottomSheetFile());
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xff173051), shape: BoxShape.circle),
                        child: Icon(
                          Icons.attach_file_sharp,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: TextField(
                                  maxLines: 8,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Write a comment...',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              child: PopupMenuButton(
                                elevation: 3.2,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                                ),
                                child: Center(
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                          BorderRadius.circular(50)),
                                      child: Icon(Icons.more_horiz_outlined)),
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.timer_outlined),
                                        Text('Burn'),
                                      ],
                                    ),
                                    value: 1,
                                  ),
                                  PopupMenuItem(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons
                                            .local_fire_department),
                                        Text('Expire')
                                      ],
                                    ),
                                    value: 2,
                                  ),
                                ],onSelected: (value){
                                if(value==1){
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => BottomSheetOne());
                                }
                                if(value==2){
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => BottomSheetTwo());
                                }
                              },

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xffd4af36), shape: BoxShape.circle),
                        child: Icon(
                          Icons.mic,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
