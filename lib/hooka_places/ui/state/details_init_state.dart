import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooka/hooka_buddies/buddies_routes.dart';
import 'package:hooka/hooka_places/request/addreview_request.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/components/CustomVerificationDialog.dart';
import '../../../utils/components/cutom_network_image.dart';
import '../../../utils/style/colors.dart';
import '../../request/isfav_request.dart';
import '../../response/details_response.dart';
import '../screen/places_details.dart';

class DetailsInitState extends States {
  final PlacesDetailsState placesDetailsState;
  final DetailsRep detailsModell;

  DetailsInitState(this.placesDetailsState, this.detailsModell);

  bool isFavvvv = true;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlayAnimation<double>(
              duration: Duration(milliseconds: 1200),
              tween: Tween(begin: 0.0, end: 200),
              builder: (context, child, value) {
                return Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                  Container(
                    height: value,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: detailsModell.image.toString(),

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
                        placeholder: (context, url) => Padding(
                          padding: const EdgeInsets.all(95.0),
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballBeat,
                            colors: [Colors.black],
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Align(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color:YellowColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  isFavvvv = !isFavvvv;
                                  placesDetailsState.refresh();
                                  placesDetailsState.isFav(
                                      IsFavorite(
                                        isFav: isFavvvv,
                                      ),
                                      detailsModell.id.toString());
                                },
                                icon: isFavvvv == detailsModell.isFavorite
                                    ? Icon(Icons.favorite,
                                        size: 30, color: Colors.red)
                                    : Icon(
                                        Icons.favorite_border,
                                        size: 30,
                                      ))),
                      ),
                    alignment: AlignmentDirectional.bottomEnd,)
                ]);
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(detailsModell.name.toString(),
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(detailsModell.rating.toString(),
                      style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 18, color: Colors.green)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detailsModell.location.toString(),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Icon(Icons.location_on_outlined,size: 12,)
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detailsModell.cuisine.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic)),
                  Icon(Icons.fastfood_rounded,size: 12,)
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detailsModell.description.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic)),
                  Icon(Icons.info_outlined,size: 12,)
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:(){launchUrl("tel://${detailsModell.phoneNumber}");},

                    child: Text(detailsModell.phoneNumber.toString(),
                        style: TextStyle(
                            fontSize: 15,decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic)),
                  ),
                  InkWell(
                      onTap: (){launchUrl("tel://${detailsModell.phoneNumber}");},

                      child: Icon(Icons.call,size: 12,))
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Icon(
                FontAwesomeIcons.clock,
                color: Colors.grey,
                size: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Text(
                  "Opening hours [${detailsModell.openingFrom} - ${detailsModell.openingTo}]",
                  style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
            ]),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
         Divider(
           height: 1,thickness: 1,color: Colors.grey,indent: 20,endIndent: 20,
         ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),


          detailsModell.favorites!.isNotEmpty?
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Favorite To",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ):Container(),
          detailsModell.favorites!.isNotEmpty?
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ):Container(),

          detailsModell.favorites!.isNotEmpty?
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 35),
            child: SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: detailsModell.favorites!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(

                            color: detailsModell.favorites![index].isAvailable!
                                ? Colors.green
                                : Colors.red,
                            width: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CachedNetworkImage(
                                imageUrl: detailsModell.favorites![index].image
                                    .toString(),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 10,
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
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ):Container(),
          detailsModell.favorites!.isNotEmpty?
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(""),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, BuddiesRoutes.Buddies,arguments: detailsModell.id);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add_circle,size: 12 ,color: YellowColor,),
                       SizedBox(width: 5,),
                       Text(
                        'Invite buddy ',
                        style: TextStyle(
                          wordSpacing: 2,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Bold'),
                      ),

                    ],
                  ),

                  ),
                ),


            ],
          ):  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, BuddiesRoutes.Buddies,arguments: detailsModell.id);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add_circle,size: 12 ,color: YellowColor,),
                      SizedBox(width: 5,),
                      Text(
                        'Invite buddy ',
                        style: TextStyle(
                            wordSpacing: 2,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Bold'),
                      ),

                    ],
                  ),

                ),
              ),
              Text(""),



            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Divider(
            height: 1,thickness: 1,color: Colors.grey,indent: 20,endIndent: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),


          Center(
            child: Container(
              width: 400,
              child: Card(
                elevation: 2,

                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01, ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Menu",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: detailsModell.menus!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(left: 10, right: 240),
                                child: Row(children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.04,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 130,
                                      width: 130,
                                      child: Center(
                                          child:
                                          CustomNetworkImage(
                                            text:"Menu",
                                            thumbnail: detailsModell.menus![index].image.toString(),
                                            imageSource: [detailsModell.menus![index].image.toString()],
                                          )
                                      ),
                                    ),
                                  ),
                                ]));
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),


          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Center(
            child: Container(   width: 400,
              child: Card(elevation: 2,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01, ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Albums",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: detailsModell.albums!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(left: 10, right: 240),
                                child: Row(children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.04,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 130,
                                      width: 130,
                                      child: Center(
                                          child:
                                          CustomNetworkImage(
                                            text:"Albums",
                                            thumbnail: detailsModell.albums![index].image.toString(),
                                            imageSource: [detailsModell.albums![index].image.toString()],
                                          )
                                      ),
                                    ),
                                  ),
                                ]));
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),


          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
        

          //reviews start
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Reviews",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: (){  showDialog(
                          context: context,
                          builder: (context) =>
                              CustomReviewDialog(continueBtn: (rate, reviewText) {
                                Navigator.pop(context);

                                placesDetailsState.AddReviewww(
                                    AddReviewReq(
                                        rating: rate, description: reviewText),
                                    detailsModell.id.toString());
                              }));},
                      child: Row(
                        children: [
                       Icon(Icons.add_circle,color: YellowColor,size: 12,),
                          SizedBox(width: 5,),
                          Text("Add review",style: TextStyle(wordSpacing: 2,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto-Bold'),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
//                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: detailsModell.reviews!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Stack(
                          children: [
                            Icon(
                              Icons.star,
                              color: YellowColor,
                              size: 45,
                            ),
                            Positioned(
                                top: 15,
                                left: 18,
                                child: Text(
                                  detailsModell.reviews![index].rating
                                      .toString(),
                                  style: TextStyle(

                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                        title: Text(
                          detailsModell.reviews![index].name.toString(),
                        ),
                        subtitle: Text(
                          detailsModell.reviews![index].description.toString(),
                        ),
                        trailing: Text(

                          detailsModell.reviews![index].createdDate!
                              .split("T")
                              .first
                              .toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        CustomReviewDialog(continueBtn: (rate, reviewText) {
                          Navigator.pop(context);

                          placesDetailsState.AddReviewww(
                              AddReviewReq(
                                  rating: rate, description: reviewText),
                              detailsModell.id.toString());
                        }));
              },
//

              child: const Text(
                'Add Review ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto-Bold'),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.12,
                    vertical: MediaQuery.of(context).size.height * 0.013),
                primary: YellowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          //reviews end
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          //Album start


        ],
      ),
    );
  }
}
