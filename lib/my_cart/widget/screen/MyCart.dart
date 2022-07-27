import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hooka/home_page/ui/widget/menu_widget.dart';
import 'package:hooka/my_cart/widget/ui/adress.dart';
import 'package:hooka/utils/style/colors.dart';

import '../../../utils/components/seperator_doted.dart';
import '../../../utils/effect/custom_page_route.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        leading: MenuWidget(),
        backgroundColor: Colors.white,
        title: Text("MyCart",style: TextStyle(color: Colors.black),),

      ),
      body:SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(

              children: [


                Icon(Icons.shopping_cart,),
                SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                Text("Your Basket",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height*0.035,
                  width: MediaQuery.of(context).size.width*0.15,

                  child: Card(
                    shape:  RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(40)),
                    color: YellowColor,
                    child: Center(child: Text(" CLEAR ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order Summary",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              ],
            ),
          ),
          Row(

          children: [




    Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text("Order amount",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
    ),
    SizedBox(width: MediaQuery.of(context).size.width*0.39,),
            Text("0.00 LBP",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

    ],),
          Row(

            children: [




              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Delivery fees",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.4,),
              Text("0.00 LBP",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

            ],),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: MySeparator(color: Colors.grey,height: 0.4,)),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          Row(

            children: [




              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Total amount",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.4,),
              Text("0.00 LBP",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

            ],),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Container(
              color: Colors.grey,
              height: 1,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Row(

            children: [




              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Delivery Adress",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.23,),
              TextButton(onPressed: (){
                Navigator.push(context, CustomPageRoute(child: Address()));
              }, child:
              Text("ADD NEW",style: TextStyle(color: YellowColor,decoration: TextDecoration.underline,fontSize: 13,fontWeight: FontWeight.bold),),)

            ],),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),

          Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Container(
              color: Colors.grey,
              height: 1,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment Method",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),


              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(

              children: [


                Card(
                    color:Colors.black,
                    child: Icon(Icons.check,color: YellowColor,size: 15,)),
                SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                Text("Cash On Delivery",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                SizedBox(width: MediaQuery.of(context).size.width*0.4,),


              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),

          Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Container(
              color: Colors.grey,
              height: 1,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          Row(

            children: [




              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Total amount",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.4,),
              Text("0.00 LBP",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

            ],),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: MySeparator(color: Colors.grey,height: 0.4,)),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          ElevatedButton(
            onPressed: () {},
//

            child: const Text(
              'PAY ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto-Bold'),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.15,
                  vertical: MediaQuery.of(context).size.height * 0.018),
              primary: YellowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ]),
      ));
  }
}
