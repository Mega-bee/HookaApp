import 'package:flutter/material.dart';

import '../../../Hooka Basket/response/basket_response.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/components/seperator_doted.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../screen/checkout.dart';
import '../widget/checkout_basket.dart';

class CheckoutInitState extends States {
  final BasketResponse basketResponse;
  final CheckoutState screenState;
  CheckoutInitState(this.basketResponse,this.screenState);
  @override
  Widget getUI(BuildContext context) {
    return   SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(

            children: [



              Text("Your Basket",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

              Spacer(),

            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:basketResponse.items!.length,
              itemBuilder: (context, index) {
                return CheckoutBasketCard(
                    basketResponse.items![index],

                  //     basketmodel[index],(){
                  //   Total1=0;
                  //   basketmodel.forEach((basketModel) {
                  //
                  //     Total1+= basketModel.bcp;
                  //
                  //
                  //   });
                  //   setState(() {
                  //
                  //   });
                  // }



                );



              }),
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
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [




              Text("Order amount",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              SizedBox(width: MediaQuery.of(context).size.width*0.39,),
              Text("0.00 LBP",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

            ],),
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [




              Text("Delivery fees",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              SizedBox(width: MediaQuery.of(context).size.width*0.4,),
              Text("0.00 LBP",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

            ],),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.02,),

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
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [




              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Delivery Adress",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.23,),
              TextButton(onPressed: (){
                // Navigator.push(context, CustomPageRoute(child: Address()));
              }, child:
              Text("ADD NEW",style: TextStyle(color: YellowColor,decoration: TextDecoration.underline,fontSize: 13,fontWeight: FontWeight.bold),),)

            ],),
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

        Container(
            width: MediaQuery.of(context).size.width*0.9,
            child: MySeparator(color: Colors.black,height: 0.4,)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),

        SizedBox(height: MediaQuery.of(context).size.height*0.02,),

        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [




              Text("Total amount",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              SizedBox(width: MediaQuery.of(context).size.width*0.4,),
              Text("${basketResponse.totalPrice} \$",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

            ],),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.02,),


        ElevatedButton(
          onPressed: () {},
//

          child: const Text(
            'Order Now',
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
    );
  }

}