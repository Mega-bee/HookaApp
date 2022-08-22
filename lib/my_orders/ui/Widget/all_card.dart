import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooka/my_orders/response/order_response.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../utils/style/colors.dart';
import '../../order_routes.dart';

class AllOrderCard extends StatefulWidget {
  final AllOrders? orderResponse;
  AllOrderCard({
    this.orderResponse
  });
  @override
  State<AllOrderCard> createState() => AllOrderCardState();
}

class AllOrderCardState extends State<AllOrderCard> {
  @override
  Widget build(BuildContext context) {

    return  InkWell(
      onTap: (){
        Navigator.pushNamed(context, OrderRoutes.ORDER_DETAILS , arguments: widget.orderResponse!.id.toString());
        print("hwloooooooooo ${widget.orderResponse!.id}");
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
                child: Center(child: Text(widget.orderResponse!.id.toString(),style: TextStyle(fontWeight: FontWeight.bold)))),
            title:Text(widget.orderResponse!.status.toString()) ,
            subtitle: Text("Total : ${widget.orderResponse!.total}"),
            trailing: Text(widget.orderResponse!.date.toString()),
          ),



          Divider(color: Colors.grey, thickness: 0),

        ],
        ),
      ),
    );
  }
}
