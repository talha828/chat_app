import 'dart:convert';

import 'package:chat_app/chat_screen/chat_search.dart';
import 'package:chat_app/wallet/coin_card.dart';
import 'package:chat_app/chat_screen/main_chat_screen.dart';
import 'package:chat_app/wallet/wallet.dart';
import 'package:chat_app/wallet/wallet_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'exchange.dart';
import 'package:http/http.dart' as http;
class BitWallet extends StatefulWidget {
  const BitWallet({Key? key}) : super(key: key);

  @override
  _BitWalletState createState() => _BitWalletState();
}

class _BitWalletState extends State<BitWallet> {
  Map<String, double> dataMap = {
    "Bit Coin": 0,
    "ETH": 0,
    "DOGE": 0,
  };
  getData()async{
    var url='https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=2&sparkline=false';
    var response =await http.get(Uri.parse(url));
    print(response.body);
    var id=jsonDecode(response.body);
    var talha=id[0]['image']['current_price'];
    print(talha);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Container(
      alignment: Alignment.topRight,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xff173051),
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
      Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(child: ImageIcon(AssetImage('assets/app_icon.png'),color: Color(0xffc69b68),size: 35,)),
          GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));}, child: ImageIcon(AssetImage('assets/message_icon.png'),color: Colors.white24,size: 35,)),
          GestureDetector(child: ImageIcon(AssetImage('assets/dollar_icon.png'),color: Colors.white,size: 35,)),
          GestureDetector(child: ImageIcon(AssetImage('assets/location_icon.png'),color: Colors.white24,size: 35,)),
          GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatSearch()));},child: ImageIcon(AssetImage('assets/search_icon.png'),color: Colors.white24,size: 40,)),
          GestureDetector(child: ImageIcon(AssetImage('assets/menu-icon.png'),color: Color(0xffc69b68),size: 30,)),
        ],
      ),
    ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children:[ Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: PieChart(
                          legendOptions: LegendOptions(
                            showLegends: false
                          ),
                          colorList: [Colors.deepOrange,Colors.blueAccent,Colors.lightGreen],
                          ringStrokeWidth: 3,
                                dataMap: dataMap,
                          chartType: ChartType.ring,
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesOutside:false,
                            showChartValues: false,
                            showChartValueBackground: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text('My Wallet',style: TextStyle(
                              color: Color(0xff173051),fontSize: 20,
                            ),),
                            SizedBox(height: 10,),
                            Text('\$ 0',style: TextStyle(
                              color: Color(0xff173051),fontSize: 25,
                            ),),
                          ],
                        ),
                      )
                      ],
                    ),
                  ),
              Stack(
                alignment: Alignment.center,
                children:[ Column(
                  children: [
                    Coins(image: 'assets/bitcoin.png',mainText: 'BTC',subTitle: 'Bitcoin',price: '2.932011',yourPrice: '\$19.000',dollarPrice: '\$102.000',profit: '+34.3%',color: Color(0xFF61AC3C),),
                    Coins(image: 'assets/Ethereum-icon.png',mainText: 'ETH',subTitle: 'Ethereum',price: '1.324113',yourPrice: '\$19.000',dollarPrice: '\$2.873',profit: '-2.3%',color: Colors.red,),
                    Coins(image: 'assets/circle-cropped.png',mainText: 'DOGE',subTitle: 'Dogecoin',price: '3.000',yourPrice: '\$2.000',dollarPrice: '\$0.98',profit: '+2.3%',color: Color(0xFF61AC3C),),
                  ],
                ),
                  Positioned(
                      bottom: 141,
                      right: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(heroTag:'btn1', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Wallet()));},child: ImageIcon(AssetImage('assets/send.png')),backgroundColor: Color(0xff173051),),
                      )),
                  Positioned(
                    bottom: 70,
                    right: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(heroTag:'btn2', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Exchange()));},child: ImageIcon(AssetImage('assets/reload.png')),backgroundColor: Color(0xff173051)),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(heroTag:'btn3', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>WalletSetting()));},child: ImageIcon(AssetImage('assets/wallet.png')),backgroundColor: Color(0xff173051)),
                    ),
                  ),

                ],
              )
                ],
              ),
            ))
          ])
    )
    )
    );
  }
}
