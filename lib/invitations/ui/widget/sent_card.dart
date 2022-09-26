import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../hooka_places/places_routes.dart';
import '../../../utils/style/colors.dart';
import '../../details_routes.dart';
import '../../response/sent_invitation_response.dart';

class SentCard extends StatefulWidget {
  final SentInvitationResponse? senttttModel;
  SentCard({
    this.senttttModel
  });
  @override
  State<SentCard> createState() => _SentCardState();
}

class _SentCardState extends State<SentCard> {
  @override
  Widget build(BuildContext context) {
    return  Column(children: <Widget>[

      Padding(
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, PlacesRoutes.Details,arguments: widget.senttttModel!.placeId.toString());
            print("iddd: ${widget.senttttModel!.placeId}");
          },
          child: Card(
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  children: [
                    Container(
                        width: 90,
                        height: 90,

                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child:   Center(
                          child: Card(elevation:0,
                            shadowColor: Colors.red[100],


                            child:

                            CachedNetworkImage(
                              imageUrl: (widget.senttttModel!.image.toString()),height:100,width: 100,fit: BoxFit.cover,
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

                        ),),

                    Flexible(

                        child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.senttttModel!.placeName.toString(),
                                    style: GoogleFonts.comfortaa(
                                        fontSize: 18, fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, DetailsInvRoutes.SentInvDetails,arguments: widget.senttttModel!.placeId.toString());

                                      },
                                      child: Container(width: 100,
                                        child: Center(
                                          child: Text("Sent Details",
                                              style: GoogleFonts.anekLatin(fontSize: 12,fontWeight: FontWeight.w500,decoration: TextDecoration.underline)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                              Container(
                                height: 20,width: 70,
                                child: Center(
                                  child: Text("${widget.senttttModel!.buddiesCount} Buddies",
                                      style: GoogleFonts.anekLatin(fontSize: 14,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.04,),



                            ])
                    ),

                  ]),
            ),
          ),
        ),
      ),



    ],
    );
  }
}
