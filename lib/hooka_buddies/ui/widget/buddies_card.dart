import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/hooka_buddies/response/buddies_response.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../../buddies_routes.dart';
import '../screens/view_profile.dart';

class BuddiesCard extends StatelessWidget {
  final BuddiesResp buddiesModel;

  final Function inviteBody;

  BuddiesCard({required this.buddiesModel, required this.inviteBody});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, BuddiesRoutes.PROFBUDDIES,
                arguments: buddiesModel.id.toString());
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(children: [
                    Positioned(
                      right: 20,
                      top: 11,
                      child: Icon(
                        Icons.rectangle,
                        size: 29,
                        color: Color.fromRGBO(250, 216, 1, 0.8),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 31,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            buddiesModel.rating.toString(),
                            style: GoogleFonts.anekLatin(
                                color: Colors.black54,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      // borderRadius: BorderRadius.only(
                      //   topRight: Radius.circular(15),
                      //   topLeft: Radius.circular(15),
                      //   bottomLeft: Radius.circular(15),
                      //   bottomRight: Radius.circular(15),
                      // ),

                      child: Container(
                        child: CachedNetworkImage(
                          imageUrl: buddiesModel.image.toString(),
                          width: 210,
                          height: 197,
                          fit: BoxFit.contain,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballBeat,
                              colors: [Colors.black],
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      // Image.asset("assets/images/restaurant-939435_960_720-768x512.jpeg",fit: BoxFit.contain,
                      //
                      // ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 199,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          color: Color.fromRGBO(235, 235, 235, 0.8),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                buddiesModel.name.toString(),
                                style: GoogleFonts.alef(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),

                        // width: 140, height: 140, fit: BoxFit.cover,
                      ),
                    ),
                    // Positioned(
                    //   bottom: 1,
                    //   left: 168,
                    //   child: Icon(
                    //     Icons.star,
                    //     size: 29,
                    //     color: Color.fromRGBO(250, 216, 1, 0.8),
                    //   ),
                    // ),
                    // Positioned(
                    //   bottom: 10,
                    //   left: 180,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         buddiesModel.rating.toString(),
                    //         style: GoogleFonts.anekLatin(
                    //             color: Colors.black54,
                    //             fontSize: 10,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ],
                    //   ),
                    // )
                    // Positioned(
                    //   bottom: 0,
                    //   child:
                    //   Container(
                    //     decoration: BoxDecoration(
                    //         color: Color.fromRGBO(250, 216, 1,0.6),
                    //         borderRadius: BorderRadius.only(
                    //           topRight: Radius.circular(35),bottomRight: Radius.circular(5),
                    //           topLeft: Radius.circular(5),bottomLeft: Radius.circular(35),
                    //
                    //         )),
                    //     width:120,
                    //     child: Column(children: [
                    //
                    //       buddiesModel.isAvailable==true?
                    //
                    //       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //         children: [
                    //
                    //           Text("Available",style: GoogleFonts.rubik(color: Colors.white,fontWeight: FontWeight.bold),),
                    //
                    //
                    //
                    //
                    //
                    //         ],
                    //       ):Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //
                    //       Text("Not Available",style: GoogleFonts.rubik(color: Colors.white,fontWeight: FontWeight.bold),),
                    //
                    //
                    //
                    //
                    //
                    //         ],
                    //       )
                    //
                    //
                    //
                    //
                    //
                    //     ],),
                    //   ),
                    // ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
