import 'package:flutter/material.dart';
import 'package:hooka/my_orders/ui/Widget/current_card.dart';

import '../../../../abstracts/states/state.dart';
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
        Expanded(
          flex: 100,
            child: Card(

                child: ListView.builder(
                    itemCount:orderResponse.currentOrders!.length ,
                    itemBuilder: (context, index) {
                      return CurrentCard(
                        currentCardresp:orderResponse.currentOrders![index],

                      );

                    })))]

      ),
    );
  }

}