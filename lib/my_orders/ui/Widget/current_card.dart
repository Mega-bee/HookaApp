import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
    return Column(children: <Widget>[

      GestureDetector(
        onTap: () =>
        {
        },
        child: Row(
            children: [


              Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 200, right: 20),

                    ),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 100),
                      child: Text(widget.currentCardresp!.status.toString(),
                          style: TextStyle(fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic)),
                    ),


                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.03,),
                        InkWell(
                          onTap: (){

                            // widget.screenstate!.refresh();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red,
                            ),
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.15,
                            child: Center(child: Text("Deny",style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.03,),

                        InkWell(
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context,
                            //     BuddiesRoutes.PROFBUDDIES,arguments: widget.receivedModel!.id.toString()
                            // );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Primarycolor,
                            ),
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.2,
                            child: Center(child: Text("View Profile",
                              style: TextStyle(color: YellowColor),)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02,),

                  ]),


            ]),),

      Divider(color: Colors.grey, thickness: 0),

    ],
    );
  }
}