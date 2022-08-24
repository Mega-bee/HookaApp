import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooka/my_orders/order_routes.dart';
import 'package:hooka/my_orders/response/order_response.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../utils/style/colors.dart';



class CurrentCard extends StatefulWidget {
final CurrentOrders? currentCardresp;

CurrentCard({
  this.currentCardresp,
});
  @override
  State<CurrentCard> createState() => CurrentCardState();
}

class CurrentCardState extends State<CurrentCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, OrderRoutes.ORDER_DETAILS , arguments: widget.currentCardresp!.id.toString());
      },
      child: Container(
          child: Column(children: <Widget>[

          ListTile(
            leading: Container(
height: 50,
                width: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),
                  color: YellowColor,
                ),
                child: Center(child: Text(widget.currentCardresp!.id.toString(),style: TextStyle(fontWeight: FontWeight.bold),))),
            title:Text(widget.currentCardresp!.status.toString()) ,
            subtitle: Text("Total : ${widget.currentCardresp!.total}"),
            trailing: Text(widget.currentCardresp!.date.toString()),
          ),

          Divider(color: Colors.grey, thickness: 0),

      ],
      ),
        ),
    );
  }
}