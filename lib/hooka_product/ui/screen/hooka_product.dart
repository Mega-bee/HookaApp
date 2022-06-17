import 'package:flutter/material.dart';
import 'package:hooka/hooka_product/ui/screen_cards/ui/hooka_witty.dart';
import '../../../home_page/ui/widget/menu_widget.dart';
import 'package:hooka/utils/images/images.dart';

import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';

class HookaProduct extends StatefulWidget {
  const HookaProduct({Key? key}) : super(key: key);

  @override
  State<HookaProduct> createState() => _HookaProductState();
}

class _HookaProductState extends State<HookaProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Hooka Products",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.black,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Image.asset(ImageAsset.LOGO,height: 250,width: 500,fit: BoxFit.cover,),

            Row( mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  InkWell(
                    onTap: (){Navigator.push(context,
                        CustomPageRoute(child: HookaWitty()));},
                    child: Card(
elevation: 0,
                      color: AmberColor,
                      child: Column(
                          children:[ Image.asset(
                            "assets/images/Hookawitty.png",
                            fit: BoxFit.scaleDown,
                            height: 100,
                            width: 150,
                          ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30,),
                              child: Text("HOOKA WITTY",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                            )
                          ] ),
                    ),
                  ),
                  Card(
                    color: AmberColor,
                    child: Column(
                        children:[ Image.asset(
                          "assets/images/HookaCapsules.png",
                          fit: BoxFit.scaleDown,
                          height: 100,
                          width: 150,
                        ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30,),
                            child: Text("HOOKA CAPSULES",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
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
                          "assets/images/Group 7.png",
                          fit: BoxFit.scaleDown,
                          height: 100,
                          width: 150,
                        ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30,),
                            child: Text("HOOKA ACCESSORIES",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14)),
                          )
                        ]),
                  ),

                ]),
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),

          ]),
      ),
    );
  }
}
