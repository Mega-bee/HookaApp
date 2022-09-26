
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../abstracts/states/state.dart';
import '../../response/sent_details_response.dart';
import '../screen/sent_details.dart';
import '../widget/details_sent_card.dart';

class DetailsSentInitState extends States {
  final DetailsSentResponse detailsSentResponse;
  final SentDetailsState sentDetailsState;
  DetailsSentInitState(this.detailsSentResponse,this.sentDetailsState);
  @override
  Widget getUI(BuildContext context) {
return SingleChildScrollView(

  child:   Container(
    color: Colors.grey[100],
height: 900,
    child: Column(
      children: [
        SizedBox(height: 20,),
        CachedNetworkImage(
          imageUrl:detailsSentResponse.placeImage.toString(),
          height: 130,
          fit: BoxFit.cover,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          ),
          placeholder: (context, url) => const Padding(
            padding: EdgeInsets.all(15.0),
            child: LoadingIndicator(
              indicatorType: Indicator.ballBeat,
              colors: [Colors.black],
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${detailsSentResponse.placeName}",
                  style: GoogleFonts.anekLatin(fontSize: 18, fontWeight: FontWeight.w600)),
              Container(
                color: Colors.green[700],height: 20,width: 40,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${detailsSentResponse.placeRating}",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,color: Colors.white)),
                    Icon(Icons.star,size: 10,color: Colors.white,)
                  ],
                ),
              ),



            ],

          ),
        ),





        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),

       Padding(
         padding: const EdgeInsets.only(left: 28.0,bottom: 8),
         child: Align(
             alignment: Alignment.centerLeft,
             child: Text("See Who are going",style: GoogleFonts.anekLatin(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black),)),
       ),

        Expanded(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:detailsSentResponse.buddies!.length,
          itemBuilder: (context, index) {
          return DetailsSentCard(sentinvModel: detailsSentResponse.buddies![index],);
          }),
        ),

      ],
    ),
  ),
);
  }

}