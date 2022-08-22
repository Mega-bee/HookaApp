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
    return  Column(children: <Widget>[

      GestureDetector(
        onTap: () =>
        {
        },
        child: Row(
            children: [
              Container(
                  width: 100,
                  height: 150,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Stack(
                      children:[

                        Center(
                          child:
                        Padding(
                          padding: const EdgeInsets.only(left: 50,bottom: 20,top: 100),
                          child: Container(
                            height: 200,
                            width: 200,
                            color: Colors.transparent,
                            child:
                            Card(color: Colors.green,child: Center(child: Text('',
                              style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),)),
                              elevation: 2,shadowColor: YellowColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(1),
                                  bottomRight:  Radius.circular(10),
                                  bottomLeft: Radius.circular(1),
                                ),
                              ),
                            ),
                          ),
                        ),),

                      ])),

              Flexible(

                  child:
                  Column(
                      children: [ Text(widget.orderResponse!.status.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Container(
                          height: 20,width: 70,
                          child: Center(
                            child: Text("${widget.orderResponse!.date}",
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                        InkWell(
                          onTap: (){
                            // Navigator.pushNamed(context, DetailsInvRoutes.SentInvDetails,arguments: widget.senttttModel!.placeId.toString());

                          },
                          child: Container(height: 30,width: 120,
                            color: YellowColor,
                            child: Center(
                              child: Text("View Details",
                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),
                            ),
                          ),
                        ),
                      ])
              ),

            ]),),

      Divider(color: Colors.grey, thickness: 0),

    ],
    );
  }
}
