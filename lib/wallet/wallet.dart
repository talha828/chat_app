import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool talha=false;
  bool talha2=false;
   String hint= ' ';
   String coin ='BTC';
   bool color =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
              color: Color(0xff173051),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                            backgroundColor: Color(0xffd4af36),
                            child: IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back,size: 24,  color: Color(0xff173051),))),
                      ),
                      Expanded(child: Container(
                        alignment: Alignment.center,
                        child: Text('Send',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),),))
                    ],
                  ),
                ),
                Expanded(child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          color: Color(0xffefeff2),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text('I Want To Send',style: TextStyle(
                                    color: Color(0xff173051),
                                  ),),
                                    Text('\$1.100',style: TextStyle(
                                      color: Color(0xff173051),
                                    ),)
                                ],),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                       iconEnabledColor:  Color(0xff173051),
                                        style: TextStyle(color:  Color(0xff173051),
                                        fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                        value:coin,
                                   items:[
                                       DropdownMenuItem(child: Row(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 5),
                                             child: Image.asset('assets/bitcoin.png',scale: 15,),
                                           ),
                                           Text('BTC'),
                                         ],
                                       ),
                                       value: 'BTC',),
                                       DropdownMenuItem(child: Row(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 5),
                                             child: Image.asset('assets/Ethereum-icon.png',scale: 28,),
                                           ),
                                           Text('ETH'),
                                         ],
                                       ),
                                       value: 'ETH',
                                       ),DropdownMenuItem(child: Row(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 5),
                                             child: Image.asset('assets/circle-cropped.png',scale: 6,),
                                           ),
                                           Text('DOGE'),
                                         ],
                                       ),
                                       value: 'DOGE',
                                       ),
                                   ],
                                        onChanged: (value){
                                       print(value);
                                       setState(() {
                                         coin=value!;
                                       });
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: Color(0xff173051),

                                      ),
                                      child: Row(
                                      children: [
                                        Text('0.621',style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20
                                        ),),
                                        Text('|  ',style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20
                                        ),),
                                      ],
                                    ),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 8),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                            Container(
                              color: Colors.grey.shade300,
                              width: MediaQuery.of(context).size.width,
                              height: 2,
                              child: Text('..',style: TextStyle(color: Colors.grey),),
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xffd4af36),
                              onPressed: null,child: ImageIcon(AssetImage('assets/send.png'),),),
                          ],),
                        ),
                        Card(
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                   Text('I Want To Send',style: TextStyle(color: Color(0xff173051),),),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   GestureDetector(
                                     onTap:(){
                                            setState(() {
                                              hint ='Type Address';
                                         talha=talha?false:true;
                                         talha2=false;
                                              if (talha ==true||talha2 == true){ color =color?false:true;}

                                            });
                                                   },
                                     child: Container(
                                       decoration:BoxDecoration(color:talha? Color(0xff173051):Colors.grey.shade400,
                                       borderRadius: BorderRadius.circular(60)
                                       ),
                                       padding: EdgeInsets.symmetric(vertical: 3,horizontal: 20),
                                       child: Row(
                                       children: [
                                         ImageIcon(AssetImage('assets/wallet.png'),color: talha?Colors.white:Color(0xff173051),),
                                         Text('Wallet',style: TextStyle( color:talha?Colors.white: Color(0xff173051),
                                         ),),
                                       ],
                                     ),),
                                   ),
                                   Text('Or',style: TextStyle(
                                     color: Color(0xff173051),
                                   ),),
                                   GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         hint ='Chose Contact';
                                         talha2=talha2?false:true;
                                         talha=false;
                                         if (talha ==true||talha2 == true){ color =color?false:true;}
                                       });
                                     },
                                     child: Container(

                                       decoration:BoxDecoration(color:talha2?Color(0xff173051):Colors.grey.shade400,
                                           borderRadius: BorderRadius.circular(60)
                                       ),
                                       padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                       child: Row(
                                         children: [
                                           Icon(Icons.person,color: talha2?Colors.white:Color(0xff173051),),
                                           Text('Contact',style: TextStyle(color: talha2?Colors.white:Color(0xff173051),
                                           ),),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                                Container(
                                  height: 50,
                                  child:  TextField(
                                    cursorHeight: 20,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: hint,
                                      filled: true,
                                      hintStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                      fillColor:color?Color(0xff173051): Colors.grey.withOpacity(0.5),
                                      border:OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none
                                          ),
                                          borderRadius: BorderRadius.circular(50.0),
                                      ),

                                    ),
                                  ),)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 2,
                            color: Colors.grey.shade300,
                            child: Text('..',style: TextStyle(
                              color: Colors.grey.shade300
                            ),),
                          ),
                        ),
                        Card(
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Sending',style: TextStyle(color:Color(0xff173051),fontSize: 22,fontWeight: FontWeight.w300 ),),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                                   child: Text('\$1.234',style: TextStyle(color:Color(0xff173051),),),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                                   child: Text('0.653',style: TextStyle(color:Color(0xff173051),fontSize: 20  ),),
                                 )
                               ],
                             )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Receiving',style: TextStyle(color:Color(0xff173051),fontSize: 22,fontWeight: FontWeight.w300 ),),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                                      child: Text('Wallet address',style: TextStyle(color:Color(0xff173051),),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                                      child: Text('X3450hi2345535',style: TextStyle(color:Color(0xff173051),fontSize: 20  ),),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap:(){},
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20,),
                        alignment: Alignment.center,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xffd4af36),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('CONFIRM - ',style: TextStyle(color: Colors.white, fontSize: 20),),
                                    Text('(FEE\$1.35)',style: TextStyle(color: Colors.white, fontSize: 17),),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                      ],
                    ),
                  )
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
