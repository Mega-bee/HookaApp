  import 'package:flutter/material.dart';
import 'package:hooka/my_orders/ui/Widget/all_card.dart';
import '../../../abstracts/states/state.dart';
import '../../../hooka_product/product_routes.dart';
import '../../../utils/style/colors.dart';
import '../../response/order_response.dart';
import '../Screen/allorder_tab.dart';


class AllOrderInitState extends States{
  final OrderResponse allorderlist;
  final AllOrderTabbState screenstate;
  AllOrderInitState(this.allorderlist,this.screenstate);
  @override
  Widget getUI(BuildContext context) {
    return  Container(
      child: Column(children: [

       allorderlist.allOrders!.isNotEmpty?

        Expanded(
            flex: 100,
            child: Card(

                child: ListView.builder(
                    itemCount:allorderlist.allOrders!.length,
                    itemBuilder: (context, index) {
                      return AllOrderCard(orderResponse: allorderlist.allOrders![index],);
                    }))):Container(
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