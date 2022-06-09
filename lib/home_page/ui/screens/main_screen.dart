

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hooka/home_page/Card/ui/hooka_product.dart';
import 'package:hooka/home_page/ui/screens/drawer_screen.dart';

import '../../../Custom_page_route.dart';
import '../../../Helpers/colors.dart';
import '../widget/menu_widget.dart';
import 'menu_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  elevation: 1,
  title: Text("Hookapp",style: TextStyle(color: Colors.black),),
  backgroundColor: Colors.white,
  leading: MenuWidget(),
  actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.black,)),
    IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.black,)),

  ],
),
       body: SingleChildScrollView(
         child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.asset("assets/images/hooka logo.png",height: 250,width: 500,fit: BoxFit.cover,),

                Row( mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Card(
                        color: AmberColor,
                        child: Column(
                            children:[ Image.asset(
                              "assets/images/hooka 2.png",
                              fit: BoxFit.cover,
                              height: 120,
                              width: 170,
                            ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30,),
                                child: Text("HOOKA PLACES",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                              )
                            ] ),
                      ),
                      Card(
                        color: AmberColor,
                        child: Column(
                            children:[ Image.asset(
                              "assets/images/hooka 4.png",
                              fit: BoxFit.cover,
                              height: 120,
                              width: 170,
                            ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30,),
                                child: Text("HOOKA BUDDIES",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
                              )
                            ]),

                      ),
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Card(
                        color: AmberColor,
                        child: Column(
                            children:[ Image.asset(
                              "assets/images/Hooka 1.png",
                              fit: BoxFit.cover,
                              height: 120,
                              width: 170,
                            ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30,),
                                child: Text("OFFERS",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
                              )
                            ]),
                      ),
                      InkWell(
                        onTap:  (){Navigator.push(
                            context,
                            CustomPageRoute(child:HookaProduct())); },
                        child: Card(
                          color: AmberColor,
                          child: Column(
                              children:[ Image.asset(
                                "assets/images/hooka 3.png",
                                fit: BoxFit.cover,
                                height: 120,
                                width: 170,
                              ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30,),
                                  child: Text("Hooka PRODUCTS",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
                                )
                              ]),
                        ),
                      ),
                    ]),
              ]),
       )
    );
  }
}
