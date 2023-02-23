import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
  this.receivedModel,required this.Accept,
});
  @override
  State<ReceivedCard> createState() => _ReceivedCardState();
}

class _ReceivedCardState extends State<ReceivedCard> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4,right: 4),
      child: SizedBox(
        height: 120,
        child: Card(
          child: Column(children: <Widget>[

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context,
                    BuddiesRoutes.PROFBUDDIES,arguments: widget.receivedModel!.id.toString()
                );
              },
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Container(
                      width: 50,
                      height: 50,


                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: (widget.receivedModel!.buddyImage.toString()),fit: BoxFit.cover,
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

                      )),
                  title:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.receivedModel!.buddyName.toString(),
                          style: GoogleFonts.alef(fontSize: 20,
                              fontWeight: FontWeight.bold,
                              )),
                      Spacer(),
                      Row(

                        children: [


                          widget.receivedModel!.invitationStatusId==1?

                          InkWell(
                              onTap: (){
                                widget.Accept(StatusInvRequest(statusId: "2"),);


                              },
                              child:

                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: YellowColor,
                                ),

                                height:25,
                                width: 40,
                                child: Center(child:  Icon(FontAwesomeIcons.check,color: Colors.black,size: 14,)),
                              )
                          ):
                          widget.receivedModel!.invitationStatusId==2?
                          InkWell(
                            onTap:  (){
      Fluttertoast.showToast(msg: "Accepted");
      },
                            child: Container(width: 40,
                              child: Center(child: Icon(


                               FontAwesomeIcons.check,color:Colors.black,size: 17,)),
                            ),
                          ):
                          InkWell(
                            onTap:  (){
                              Fluttertoast.showToast(msg: "Not Accepted");
                            },
                            child: Container(width: 40,
                              child: Center(child: Icon(


                                FontAwesomeIcons.close,color:Colors.black,size: 17,)),
                            ),
                          ),
                          SizedBox(width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.07,),

                          widget.receivedModel!.invitationStatusId ==1?
                          InkWell(
                            onTap: (){
                              widget.Accept(StatusInvRequest(statusId: "3"),);



                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red[200],
                              ),
                              height: 25,
                              width: 25,
                              child: Center(child:  Icon(FontAwesomeIcons.close,color: Colors.black,size: 14,)),
                            ),
                          ):Container(),


                          SizedBox(width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.02,),

                        ],
                      ),
                    ],
                  ),
                  subtitle:  Column(
                    children: [

                      Row(
                        children: [
                          Text("${widget.receivedModel!.restaurantName}",style: GoogleFonts.anekLatin(fontSize: 12),),


                        ],
                      ),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${widget.receivedModel!.invitationDate!.split("T").first}",style: GoogleFonts.anekLatin(fontSize: 12),),

                        ],
                      ),  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${widget.receivedModel!.invitationOption}",style: GoogleFonts.anekLatin(fontSize: 12),),

                        ],
                      ),
                      // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text("Option :"),
                      //     Text(" ${widget.receivedModel!.invitationOption}"),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Text("Restaurent : "),
                      //     Text(" ${widget.receivedModel!.restaurantName}"),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),),



          ],
          ),
        ),
      ),
    );
  }
}