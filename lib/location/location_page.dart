import 'dart:async';

import 'package:chat_app/chat_screen/chat_search.dart';
import 'package:chat_app/wallet/bit_wallet.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Completer<GoogleMapController> _controller = Completer();
  final _initialCameraPosition = CameraPosition(
            target: LatLng( 30.3753,69.3451),
           zoom: 11,
               );
  bool status=true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topRight,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xff173051),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(child: ImageIcon(AssetImage('assets/app_icon.png'),color: Color(0xffc69b68),size: 35,)),
                    GestureDetector(child: ImageIcon(AssetImage('assets/message_icon.png'),color:  Colors.white24,size: 35,)),
                    GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BitWallet()));},child: ImageIcon(AssetImage('assets/dollar_icon.png'),color: Colors.white24,size: 35,)),
                    GestureDetector(child: ImageIcon(AssetImage('assets/location_icon.png'),color: Colors.white,size: 35,)),
                    GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatSearch()));},child: ImageIcon(AssetImage('assets/search_icon.png'),color: Colors.white24,size: 40,)),
                    PopupMenuButton(
                        elevation: 3.2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Center(
                            child: ImageIcon(
                              AssetImage('assets/menu-icon.png'),
                              color: Color(0xffcfa577),
                              size: 30,
                            )),
                        itemBuilder: (context) =>
                        [
                          PopupMenuItem(
                            child: Text(
                              "New Group",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "New Broadcast",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            value: 2,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Send Crypto",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            value: 3,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "VPN",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            value: 4,
                          ),
                          PopupMenuItem(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Online Status",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: CustomSwitch(
                                    activeColor: Color(0xff52cc56),
                                    value: status,
                                    onChanged: (value) {
                                      setState(() {
                                        status = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            value: 5,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Invite Friends",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            value: 6,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Settings",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            value: 7,
                          ),

                          PopupMenuItem(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Divider(thickness: 2,color: Colors.grey,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),]
                            ),
                            value: 8,
                          ),
                        ]),                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                  ),
                  child:Stack(
                   children:[ GoogleMap(
                     indoorViewEnabled: true,
                     mapType: MapType.normal,
                     myLocationButtonEnabled: true,
                     onMapCreated: (GoogleMapController controller) {
                       _controller.complete(controller);
                     },
                     zoomControlsEnabled: false,
                     tiltGesturesEnabled: true,
                     rotateGesturesEnabled: true,
                     myLocationEnabled: true,
                mapToolbarEnabled: true,
                initialCameraPosition: _initialCameraPosition,
                   ),
                     Container(
                       margin: EdgeInsets.symmetric(horizontal:20,vertical: 20
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                       ),
                       child: TextField(
                         decoration: InputDecoration(
                           filled: true,
                             hintText: 'Search Destination',
                             suffixIcon: Icon(Icons.search,color: Colors.grey,),

                             border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
                             disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
                             errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
                             focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
                             fillColor: Colors.white
                         ),
                       ),
                     ),
                     Positioned(
                         bottom: 150,
                         right: 10,
                         child: FloatingActionButton(onPressed: (){},child: ImageIcon(AssetImage('assets/vpn.png'),color: Colors.white,size: 35,),backgroundColor: Color(0xff173051),)),
                     Positioned(
                         bottom: 80,
                         right: 10,
                         child: FloatingActionButton(onPressed: (){},child: Icon(Icons.my_location),backgroundColor: Color(0xff173051),)),
                     Positioned(
                         bottom: 10,
                         right: 10,
                         child: FloatingActionButton(onPressed: (){},child: ImageIcon(AssetImage('assets/trunn.png'),color: Colors.white,size: 35,),backgroundColor: Color(0xff173051),))
                   ]
                  ),
                  ),
                ),
              ])
          ),
        ),
      ),
    );
  }
}
