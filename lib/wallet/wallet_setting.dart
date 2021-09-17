import 'package:chat_app/wallet/coin_button.dart';
import 'package:flutter/material.dart';
class WalletSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xff173051),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(

                    child: Padding(
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
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                      ),
                      child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,

                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child:CircleAvatar(
                                      backgroundColor: Color(0xfffbf7ea),
                                      radius: 90,
                                      child: CircleAvatar(
                                        backgroundColor: Color(0xfff4e9c5),
                                        radius: 70,
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xffebd89a),
                                          radius: 50,
                                          child: ImageIcon(AssetImage('assets/wallet.png',),color: Color(0xffd4af36),size: 60,),
                                        ),
                                      ),
                                    ) ,
                                  ),
                                ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,

                            children: [

                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff7efd6),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('CFSD1VBG54DGFS6.....',style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xffd4af36)
                                      ),),
                                      Icon(Icons.copy,color:  Color(0xffd4af36),)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color:Color(0xff173051),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                                  child: Text('GENERATE NEW ADDRESS CODE',style: TextStyle(
                                    fontSize: 16,
                                    color:Color(0xff173051),
                                  ),),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height: 2,
                                color: Colors.grey.shade300,
                                child:Text('..',style: TextStyle(
                                  color: Colors.grey.shade300,
                                ),),),
                              SizedBox(height: 10,),

                            ],
                          ),
                               CoinButton(texts: 'Back Phase',icon: Icons.info,),
                                CoinButton(texts: 'Security',icon: Icons.lock,),
                                CoinButton(texts: 'Setting',icon: Icons.settings,),
                                CoinButton(texts: 'Support',icon: Icons.contact_support,)
                              ],
                            ),
                          ),
                        ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          ),
        ),
    );
  }
}
