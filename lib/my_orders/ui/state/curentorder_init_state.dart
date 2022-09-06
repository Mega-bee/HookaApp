import 'package:flutter/material.dart';
import 'package:hooka/my_orders/ui/Widget/current_card.dart';

import '../../../../abstracts/states/state.dart';
import '../../../hooka_product/product_routes.dart';
import '../../../utils/style/colors.dart';
import '../../response/order_response.dart';
import '../Screen/current_tab.dart';


class CurrentOrderInitState extends States{
  final OrderResponse orderResponse;
  final CurrentTabState screenstate;
  CurrentOrderInitState(this.orderResponse,this.screenstate);
  @override
  Widget getUI(BuildContext context) {
 return
      Container(
      child: Column(children: [


        orderResponse.currentOrders!.isNotEmpty?
        Expanded(
          flex: 100,
            child: Card(

                child:

                ListView.builder(
                    itemCount:orderResponse.currentOrders!.length ,
                    itemBuilder: (context, index) {
                      return CurrentCard(
                        currentCardresp:orderResponse.currentOrders![index],

                      );

                    })
            
            )):Container(
            height: 220,
            child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("No Orders Yet ... To Make An order  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                InkWell(
                  onTap: (){Navigator.pushNamed(context, ProductsRoutes.Product);},
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Discover Products",style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.underline,fontWeight: FontWeight.bold,color: Colors.black ),),
                      Icon(Icons.emoji_emotions_outlined,color: YellowColor,size: 20,)
                    ],
                  ),
                ),
              ],
            ),))

      ]

      ),
    );
  }

}