import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../hooka_buddies/buddies_routes.dart';
import '../../../utils/style/colors.dart';
import '../../request/status_inv_request.dart';
import '../../response/received_invitation_response.dart';
import '../screen/received_tab.dart';


class ReceivedCard extends StatefulWidget {
final ReceivedInvitationResponse? receivedModel;
final Function Accept ;
ReceivedCard({
  this.receivedModel,required this.Accept
});
  @override
  State<ReceivedCard> createState() => _ReceivedCardState();
}

class _ReceivedCardState extends State<ReceivedCard> {

  bool Done=false;
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

                      child:
                      CachedNetworkImage(
                        imageUrl: (widget.receivedModel!.buddyImage.toString()),height: 600,fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Padding(
                          padding: const EdgeInsets.all(95.0),
                          child: LoadingIndicator(

                            indicatorType:
                            Indicator.ballBeat,


                            colors: [Colors.black],
                          ),),
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                      child: Text(widget.receivedModel!.buddyName.toString(),
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
                        Done==false?
                        InkWell(
                          onTap: (){
                            widget.Accept(StatusInvRequest(statusId: "2"));
                            Done=true;

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: YellowColor,
                            ),

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
                        ):Text(widget.receivedModel!.invitationStatus.toString()),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.03,),
                        Done==false?
                        InkWell(
                          onTap: (){
                            widget.Accept(StatusInvRequest(statusId: "3"));
                            Done=true;
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
                        ):Container(),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.03,),

                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context,
                                BuddiesRoutes.PROFBUDDIES,arguments: widget.receivedModel!.id.toString()
                            );
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