import 'package:flutter/material.dart';

class BottomSheetOne extends StatefulWidget {
  @override
  _BottomSheetOneState createState() => _BottomSheetOneState();
}

class _BottomSheetOneState extends State<BottomSheetOne> {
  dynamic num =1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade600,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              width: 300,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Divider(

                color: Colors.grey.shade300,
                thickness: 7,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text('Set Message Burn-on-days',style: TextStyle(
                          color: Colors.grey.shade500,fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      Container(
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Row(children: [Radio(value: 1, groupValue: num, onChanged: (value){ setState(() {num=value;});},activeColor: Colors.grey,), Text('Off',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 2, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('3 Second',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 3, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('5 Second',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 4, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('10 Second',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 5, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('15 Second',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Row(children: [Radio(value: 6, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('30 Second',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 7, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('1 Minute',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 8, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('2 Minutes',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 9, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('5 Minutes',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 10, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('10 Minutes',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
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
                                  hintText: 'Burn comment...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
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
    );
  }
}
class BottomSheetTwo extends StatefulWidget {
  @override
  _BottomSheetTwoState createState() => _BottomSheetTwoState();
}

class _BottomSheetTwoState extends State<BottomSheetTwo> {
  dynamic num=1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade600,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              width: 300,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Divider(

                color: Colors.grey.shade300,
                thickness: 7,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text('Set Message Expire-on-days',style: TextStyle(
                          color: Colors.grey.shade500,fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      Container(
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Row(children: [Radio(value: 1, groupValue: num, onChanged: (value){ setState(() {num=value;});},activeColor: Colors.grey,), Text('Off',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 2, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('6 hours',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 3, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('12 hours',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 4, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('1 Day',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 5, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('2 Days',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                              ],
                            ),
                            SizedBox(width: 40,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Row(children: [Radio(value: 6, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('3 Day',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 7, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('4 Day',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 8, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('5 Day',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 9, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('6 Day',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                                Row(children: [Radio(value: 10, groupValue: num, onChanged: (value){setState(() {num=value;});},activeColor: Colors.grey,), Text('7 Day',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)) ,],),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
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
                                  hintText: 'Expire comment...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
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
    );
  }
}

class BottomSheetFile extends StatefulWidget {
  const BottomSheetFile({Key? key}) : super(key: key);

  @override
  _BottomSheetFileState createState() => _BottomSheetFileState();
}

class _BottomSheetFileState extends State<BottomSheetFile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade600,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(30)),
              width: MediaQuery.of(context).size.width / 3,
              child: Divider(
                indent: 10,
                color: Colors.grey.shade300,
                thickness: 7,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfff3c04b),
                  ),
                  padding: EdgeInsets.all(15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.insert_drive_file,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff4b78e2),
                  ),
                  padding: EdgeInsets.all(15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffaaa9f5),
                  ),
                  padding: EdgeInsets.all(15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffbd58ce),
                  ),
                  padding: EdgeInsets.all(15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.photo,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff60c255),
                  ),
                  padding: EdgeInsets.all(15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfff78e0e),
                  ),
                  padding: EdgeInsets.all(15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.music_note_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffeb6161),
                  ),
                  padding: EdgeInsets.all(15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff0eaaf4),
                  ),
                  padding: EdgeInsets.all(15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.my_location_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.my_location_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

