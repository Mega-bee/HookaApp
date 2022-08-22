import 'package:flutter/material.dart';
import 'package:hooka/my_orders/ui/Widget/all_card.dart';
import '../../../abstracts/states/state.dart';
import '../../response/order_response.dart';
import '../Screen/allorder_tab.dart';


class AllOrderInitState extends States{
  final OrderResponse allorderlist;
  final AllOrderTabbState _allOrderTabbState;
  AllOrderInitState(this.allorderlist,this._allOrderTabbState);
  @override
  Widget getUI(BuildContext context) {
    return  Container(
      child: Column(children: [
        Expanded(
            flex: 100,
            child: Card(

                child: ListView.builder(
                    itemCount:allorderlist.allOrders!.length,
                    itemBuilder: (context, index) {
                      return AllOrderCard(orderResponse: allorderlist.allOrders![index],);
                    })))]

      ),
    );
  }

}