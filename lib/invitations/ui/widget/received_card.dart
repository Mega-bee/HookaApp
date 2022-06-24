import 'package:flutter/material.dart';
import 'package:hooka/invitations/model/received_model.dart';

import '../../../buddies/ui/screens/view_profile.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';


class ReceivedCard extends StatefulWidget {
final ReceivedModel? receivedModel;
ReceivedCard({
  this.receivedModel
});
  @override
  State<ReceivedCard> createState() => _ReceivedCardState();
}

class _ReceivedCardState extends State<ReceivedCard> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[

      GestureDetector(
        onTap: () =>
        {
        },
        child: Row(
            children: [
              Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Center(
                    child: Card(elevation: 10,
                      shadowColor: YellowColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60)),

                      child: CircleAvatar(
                        foregroundImage: AssetImage(
                           "${widget.receivedModel!.image}", ),
                        radius: 120,
                        backgroundColor: Colors.green,

                      ),
                    ),

                  )),

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
                      child: Text(widget.receivedModel!.title.toString(),
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
                        Container(
                          color: YellowColor,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.03,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.15,
                          child: Center(child: Text("Accept")),
                        ),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.03,),
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            color: Colors.red,
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
                            Navigator.push(
                                context, CustomPageRoute(child: ViewProfile()));
                          },
                          child: Container(
                            color: Primarycolor,
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