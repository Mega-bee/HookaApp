import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../hooka_buddies/buddies_routes.dart';
import '../../../utils/style/colors.dart';
import '../../response/received_invitation_response.dart';
import '../../response/sent_details_response.dart';


class DetailsSentCard extends StatefulWidget {
  final Buddies sentinvModel;
  DetailsSentCard({
    required this.sentinvModel
  });
  @override
  State<DetailsSentCard> createState() => _DetailsSentCardState();
}

class _DetailsSentCardState extends State<DetailsSentCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 8),
      child: Card(

        child: Column(children: <Widget>[

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
                        child: Card(
                      elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),

                          child:
                          CachedNetworkImage(
                            imageUrl: (widget.sentinvModel.buddyImage.toString()),height: 600,fit: BoxFit.cover,
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

                  Column(crossAxisAlignment: CrossAxisAlignment.start,

                      children: [


                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 100),
                          child: Text(widget.sentinvModel.buddyName.toString(),
                              style: GoogleFonts.alef(fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  )),
                        ),


                        SizedBox(height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.01,),


                         Padding(
                            padding: const EdgeInsets.only(left: 10, right: 100),
                            child: Text(widget.sentinvModel.invitationStatus.toString(),
                                style: GoogleFonts.alef(fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    )),
                          ),



                ]),



        ],),
        )]),
      ),
    );
  }
}