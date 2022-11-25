
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../response/offers_details_response.dart';
import '../screen/offers_details_screens.dart';
import 'package:url_launcher/url_launcher.dart';



class OffersDetailsInitState extends States{
  final OffDetailsResponse detailsResponse;
  final OffersDetailsScreenState offersDetailsScreenState;
  OffersDetailsInitState(this.offersDetailsScreenState,{required this.detailsResponse});

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
        Container(
        // height: value,
        child: Center(
          child:
          CachedNetworkImage(
            imageUrl:detailsResponse.image.toString(),height: 600,fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            placeholder: (context, url) =>

            const Padding(
              padding:  EdgeInsets.all(15.0),
              child: LoadingIndicator(

                indicatorType:
                Indicator.ballBeat,


                colors: [Colors.black],
              ),),
            errorWidget: (context, url, error) =>const Icon(Icons.error),
          ),
        ),
      ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 30.0,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(detailsResponse.restaurantName.toString(),
                    style:
                       GoogleFonts.alef(fontSize: 25, fontWeight: FontWeight.bold)),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),

                      color:
                      detailsResponse.rating! <= 2?
                      Colors.red:
                      detailsResponse.rating! <= 4?
                      Colors.orange:Colors.green[700],),
                    width: 50,height: 20,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(detailsResponse.rating.toString(),style:  GoogleFonts.anekLatin(

                            color: Colors.white,fontSize: 15),),
                        Icon(Icons.star,size: 10,color: Colors.white,)
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detailsResponse.cuisine.toString(),
                      style:
                      GoogleFonts.anekLatin(fontSize: 15, fontWeight: FontWeight.w500)),
                  Icon(Icons.fastfood_rounded,size: 12,)
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detailsResponse.restaurantDescription.toString(),
                      style:
                      GoogleFonts.anekLatin(fontSize: 14, fontWeight: FontWeight.w400)),
                  Icon(Icons.info_outlined,size: 12,)
                ],
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detailsResponse.location.toString(),
                      style:
                      GoogleFonts.anekLatin(fontSize: 13, fontWeight: FontWeight.w500)),
                  Icon(Icons.location_on_outlined,size: 12,)
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:(){launchUrl("tel://${detailsResponse.phonNumber}");},

                    child: Text(detailsResponse.phonNumber.toString(),style: GoogleFonts.anekLatin(
                        fontStyle: FontStyle.italic,color: Colors.black,decoration: TextDecoration.underline
                    ),
                    ),),
                  InkWell(
                      onTap: (){launchUrl("tel://${detailsResponse.phonNumber}");},

                      child: Icon(Icons.call,size: 12,))
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(children: [
               const Icon(
                  FontAwesomeIcons.clock,
                  color: Colors.grey,
                  size: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Text("Opening hours [${detailsResponse.openningFrom} -${detailsResponse.openningTo}]",
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
              ]),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding:
            const EdgeInsets.only(right: 20, left: 20),
            child: Container(
              color: Colors.grey,
              height: 1,
              width: MediaQuery.of(context).size.width * 0.82,
            ),
          ),



          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
           Padding(
            padding:  EdgeInsets.only(left: 35, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Offer",
                  style:
                  GoogleFonts.alef(fontSize: 22, fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(padding: EdgeInsets.only(left: 35,right: 20,),child: Align(
            alignment: Alignment.centerLeft,
            child: Container(color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(detailsResponse.offerDescription.toString(),style: GoogleFonts.anekLatin(
                    color: YellowColor,fontSize: 15,fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ),),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35,right: 20),
            child: Container(


              padding: EdgeInsets.only(top: 5.0),
              child: Table(

                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Title",style: GoogleFonts.comfortaa(fontWeight: FontWeight.w400),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Type",style:  GoogleFonts.comfortaa(fontWeight: FontWeight.w400),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Discount",style:  GoogleFonts.comfortaa(fontWeight: FontWeight.w400),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Expiry Date",style:  GoogleFonts.comfortaa(fontWeight: FontWeight.w400),),
                    ),
                  ]),
                  TableRow(children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailsResponse.offerTitle.toString(),style: GoogleFonts.anekLatin(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailsResponse.type.toString(),style:  GoogleFonts.anekLatin(fontWeight: FontWeight.bold,),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailsResponse.discount.toString(),style: GoogleFonts.anekLatin(fontWeight: FontWeight.bold,),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailsResponse.expiryDate!.split("T").first.toString(),style:  GoogleFonts.anekLatin(fontWeight: FontWeight.bold,),),
                    ),
                  ])
                ],
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),





        ],
      ),
    );
  }

}