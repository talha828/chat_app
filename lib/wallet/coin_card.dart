import 'package:flutter/material.dart';
class Coins extends StatelessWidget {
  Coins({this.dollarPrice,this.image,this.color,this.price,this.mainText,this.profit,this.subTitle,this.yourPrice});
  final image;
  final mainText;
  final subTitle;
  final price;
  final yourPrice;
  final dollarPrice;
  final profit;
  final color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[350],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                child: Image.asset(image,width: 60,),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(mainText,style: TextStyle(
                                  color: Color(0xff173051),
                                  fontSize: 17
                              ),),
                              Text(subTitle,style: TextStyle(
                                  color: Color(0xff173051),
                                  fontSize: 11
                              ),)
                            ],),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(price,style: TextStyle(
                                  color: Color(0xff173051),
                                  fontSize: 17
                              ),),
                              Text(yourPrice,style: TextStyle(
                                  color: Color(0xff173051),
                                  fontSize: 11
                              ),)
                            ],),
                        ],
                      ),
                    ),
                    Container(
                        width: 200,
                        height: 1,
                        color: Colors.grey[600],
                        child: Text('...')),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(dollarPrice,style: TextStyle(
                            color: Colors.grey,
                          ),),
                          Text(profit,style: TextStyle(
                            color: color,
                          ),),
                        ],
                      ),
                    )
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
