
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';
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
      child: Container(

        child: Column(
          children: [
            PlayAnimation<double>(
                duration:const Duration(milliseconds: 1200),
                // delay: Duration(milliseconds: 400),
                tween: Tween(begin: 0.0, end: 250),
                builder: (context, child, value) {
                  return Container(
                    height: value,
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
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detailsResponse.restaurantName.toString(),
                      style:
                      const   TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Container(
                    height: 30,
                    width: 70,
                    color: Colors.transparent,
                    child: Card(
                        color: Colors.green,
                        child: Center(
                            child: Text(detailsResponse.rating.toString(),
                                style:const TextStyle(
                                    fontSize:18, color: Colors.white)))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(detailsResponse.location.toString(),
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(

                  child: Card(
                    color: Colors.deepOrange[200],
                    child: SizedBox(
                      width: 160,
                      height: 20,
                      child: Center(
                        child: Text(
                            detailsResponse.cuisine.toString(),

                            style:
                            const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic)),
                      ),
                    ),
                  ),
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
            const Padding(
              padding:  EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Description",
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(detailsResponse.restaurantDescription.toString(),
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Offer",
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 30 ,end: 30),
              child: Card(
                elevation: 4,
                shadowColor: Colors.red[100],
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [  Column(children: [
                      const Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("type"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(detailsResponse.type.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ],),
                      Padding(
                        padding:const EdgeInsets.only(right: 2, left: 24),
                        child: Container(
                          color: Colors.black,
                          height: 50,
                          width: 1,
                        ),
                      ),

                      Column(children: [
                        const Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Discount"),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${detailsResponse.discount} %",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ],),
                      Padding(
                        padding: EdgeInsets.only(right: 2, left: 24),
                        child: Container(
                          color: Colors.black,
                          height: 50,
                          width: 1,
                        ),
                      ),
                      Column(children: [
                        const Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Expiry Date"),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(detailsResponse.expiryDate!.split("T").first.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ],),
                    ]),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            ElevatedButton(

              onPressed: () {

                launchUrl("tel://${detailsResponse.phonNumber}");





              },
//

              child: const Text(
                'BOOK ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto-Bold'),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: MediaQuery.of(context).size.height * 0.018),
                primary: YellowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),



          ],
        ),
      ),
    );
  }

}