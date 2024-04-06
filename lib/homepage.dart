import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:izetpay/scanqr.dart';

class home_p extends StatefulWidget {
  const home_p({Key? key}) : super(key: key);

  @override
  State<home_p> createState() => _home_pState();
}

class _home_pState extends State<home_p> {
  var location = "current location";
  var upiid = "";
  List pic = [
    "asset/pic.png",
    "asset/pic2.jpeg",
    "asset/pic3.png",
    "asset/pic4.jpeg",
  ];
  int currentpage = 0 ;

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    // var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.purple,
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 8),
                child: Container(
                  width: 40,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("asset/izetprof.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "add location",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    location,
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.help, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
         CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Stack(
                     children: [
                      CarouselSlider.builder(
                      carouselController: CarouselController(),
                      itemCount: pic.length,
                      itemBuilder:
                          (BuildContextcontext, int index, int pageViewIndex) {
                        return Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(pic[index]), fit: BoxFit.fill),
                          ),
                        );
                      },
                      options: CarouselOptions(
                          height: 160,
                          aspectRatio: 8 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2),
                          autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentpage = index;
                            });
                          }),
                                   ),
                       Positioned(
                         bottom: 10,
                         left: 0,
                         right: 0,
                         child: DotsIndicator(
                           dotsCount: pic.length,
                           position:  currentpage.toInt(),
                           decorator: DotsDecorator(
                             size: Size(8, 6),
                             color: Colors.grey,
                             activeColor: Colors.deepPurple,
                           ),
                         ),
                       ),
                     ]
                   ),
                 ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                   decoration: BoxDecoration(
                   gradient: LinearGradient(
                   begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blueGrey], // First color is applied to top, second color to bottom
            stops: [0.5, 1.0], // Adjust stops if needed
            ),
                     borderRadius: BorderRadius.circular(9),
                   ),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Transfer Money",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:Column(
                                  children: [
                                    Container(
                                          width: 52,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Colors.deepPurple,
                                          ),
                                          child: Icon(Icons.person,color: Colors.white,),
                                        ),
                                    Text(" to mobile \n number",style: TextStyle(color: Colors.white,fontSize: 12),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                          width: 52,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Colors.deepPurple,
                                          ),
                                          child: Icon(Icons.account_balance,color: Colors.white,),
                                        ),
                                      Text(" to bank \n UPI ID",style: TextStyle(color: Colors.white,fontSize: 12),)
                                    ],
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                 child:    Column(
                                   children: [
                                     Container(
                                          width: 52,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Colors.deepPurple,
                                          ),
                                          child: Icon(Icons.money_rounded,color: Colors.white,),

                                        ),
                                     Text(" to self \n account",style: TextStyle(color: Colors.white,fontSize: 12),)

                                   ],
                                 ),

                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                   child:  Column(
                                     children: [
                                       Container(
                                          width: 52,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Colors.deepPurple,
                                          ),
                                          child: Icon(Icons.mobile_friendly,color: Colors.white,),
                                        ),
                                       Text(" to mobile \n number",style: TextStyle(color: Colors.white,fontSize: 12),)

                                     ],
                                   ),

                              ),
                            ],
                          ),
                       Divider(),
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Row(
                           children: [
                             Row(
                               children: [
                                 Text("My UPI ID:",style: TextStyle(color: Colors.white),),
                                 Text(upiid,style: TextStyle(color: Colors.white),)
                               ],
                             ),
                           ],
                         ),
                       )
                        ],
                      ),
                    ),
                  ),
                ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 90,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Icon(Icons.wallet,color: Colors.white,size: 40,),
              Text("izetpe Wallet",style: TextStyle(color: Colors.white,fontSize: 12),),
            ],
          ),
        ),
            ),
            Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 90,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Icon(Icons.card_giftcard,color: Colors.white,size: 40,),
              Text("Rewards",style: TextStyle(color: Colors.white,fontSize: 12),),
            ],
          ),
        ),
            ),
            Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 90,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              children: [
                Icon(Icons.wallet_membership,color: Colors.white,size: 40,),
                Text("Refer&Get₹50 ",style: TextStyle(color: Colors.white,fontSize: 10),),
              ],
            ),
          ),
        ),
            ),

          ],
        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 280,
                      width:  MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Recharge & Pay Bills",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.monetization_on,color: Colors.purple,size: 50,),
                                    Text("Mobile\nRecharge",style: TextStyle(color: Colors.white,fontSize: 12),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.network_check,color: Colors.purple,size: 50,),
                                    Text("DTH",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.electric_bolt,color: Colors.purple,size: 50,),
                                    Text("Electricity",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.credit_card,color: Colors.purple,size: 50,),
                                    Text("Credit card\nBill paym..",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.monetization_on,color: Colors.purple,size: 50,),
                                    Text("Mobile\nRecharge",style: TextStyle(color: Colors.white,fontSize: 12),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.network_check,color: Colors.purple,size: 50,),
                                    Text("DTH",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.electric_bolt,color: Colors.purple,size: 50,),
                                    Text("Electricity",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.credit_card,color: Colors.purple,size: 50,),
                                    Text("Credit card\nBill paym..",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Sponsored Links",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons1.jpeg")),
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons2.png")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons3.png")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons4.jpeg")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 280,
                      width:  MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Recharge & Pay Bills",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.monetization_on,color: Colors.purple,size: 50,),
                                    Text("Mobile\nRecharge",style: TextStyle(color: Colors.white,fontSize: 12),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.network_check,color: Colors.purple,size: 50,),
                                    Text("DTH",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.electric_bolt,color: Colors.purple,size: 50,),
                                    Text("Electricity",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.credit_card,color: Colors.purple,size: 50,),
                                    Text("Credit card\nBill paym..",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.monetization_on,color: Colors.purple,size: 50,),
                                    Text("Mobile\nRecharge",style: TextStyle(color: Colors.white,fontSize: 12),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.network_check,color: Colors.purple,size: 50,),
                                    Text("DTH",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.electric_bolt,color: Colors.purple,size: 50,),
                                    Text("Electricity",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.credit_card,color: Colors.purple,size: 50,),
                                    Text("Credit card\nBill paym..",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                       CarouselSlider.builder(
                        carouselController: CarouselController(),
                        itemCount: pic.length,
                        itemBuilder:
                            (BuildContextcontext, int index, int pageViewIndex) {
                          return Container(
                            height: 400,
                            width:MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(pic[index]), fit: BoxFit.fill),
                            ),
                          );
                        },
                        options: CarouselOptions(
                            height: 200,
                            aspectRatio: 8 / 9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 2),
                            autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentpage = index;
                              });
                            }),
                      ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: DotsIndicator(
                            dotsCount: pic.length,
                            position:  currentpage.toInt(),
                            decorator: DotsDecorator(
                              size: Size(8, 6),
                              color: Colors.grey,
                              activeColor: Colors.deepPurple,
                            ),
                          ),
                        ),

            ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 170,
                      width:  MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Recharge & Pay Bills",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.monetization_on,color: Colors.purple,size: 50,),
                                    Text("Mobile\nRecharge",style: TextStyle(color: Colors.white,fontSize: 12),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.network_check,color: Colors.purple,size: 50,),
                                    Text("DTH",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.electric_bolt,color: Colors.purple,size: 50,),
                                    Text("Electricity",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.credit_card,color: Colors.purple,size: 50,),
                                    Text("Credit card\nBill paym..",style: TextStyle(color: Colors.white,fontSize: 12),)

                                  ],
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width ,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Sponsored Links",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons1.jpeg")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons2.png")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons3.png")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons4.jpeg")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width ,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Sponsored Links",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons1.jpeg")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons2.png")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons3.png")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons4.jpeg")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Sponsored Links",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons1.jpeg")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons2.png")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/spons3.png")),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text("MPL Cricket",style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // Column(
                              //   children: [
                              //     ClipRRect(
                              //       borderRadius: BorderRadius.circular(20),
                              //       child: Container(
                              //         width: 80,
                              //         height: 80,
                              //         decoration: BoxDecoration(
                              //           image: DecorationImage(image: AssetImage("asset/spons4.jpeg")),
                              //         ),
                              //       ),
                              //     ),
                              //     Padding(
                              //       padding: const EdgeInsets.all(8.0),
                              //       child: Row(
                              //         children: [
                              //           Text("MPL Cricket",style: TextStyle(color: Colors.white),),
                              //         ],
                              //       ),
                              //     ),
                              //
                              //   ],
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                 Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: 150,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanQR()));
                    }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.qr_code_2),
                        SizedBox(width: 10,),
                        Text("Scan QR"),
                      ],
                    ),style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.purple),
                    ),),
                  ),
                                    ),
                ],
              ),
            ),
          ],
        ),
    ]
      ),
    );
  }
}


