import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/hooka_buddies/buddies_routes.dart';
import 'package:hooka/hooka_places/request/addreview_request.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
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
  var format = DateFormat("HH:mm");
  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(detailsModell.name.toString(),
                    style:
                        GoogleFonts.alef(fontSize: 20, fontWeight: FontWeight.bold)),
                Spacer(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),

                        color:
                        detailsModell.rating! <= 2?
                        Colors.red:
                        detailsModell.rating! <= 4?
                        Colors.orange:Colors.green[700],),
                      width: 50,height: 20,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(detailsModell.rating.toString(),style:  GoogleFonts.anekLatin(

                              color: Colors.white,fontSize: 15),),
                          Icon(Icons.star,size: 10,color: Colors.white,)
                        ],
                      )),
                ),
                IconButton(
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
                        size: 20, color: Colors.red)
                        : Icon(
                      Icons.favorite_border,
                      size: 20,
                    )),
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
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detailsModell.cuisine.toString(),
    style: GoogleFonts.anekLatin(fontWeight: FontWeight.w500,
    color: Colors.black),),
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
              child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detailsModell.location.toString(),
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
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
                  Text(detailsModell.description.toString(),
    style: GoogleFonts.anekLatin(
    fontStyle: FontStyle.italic,color: Colors.black),),
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

                    child: Text(detailsModell.phoneNumber.toString(),style: GoogleFonts.anekLatin(
    fontStyle: FontStyle.italic,color: Colors.black,decoration: TextDecoration.underline
                        ),
                  ),),
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
                  "Opening hours [  ${detailsModell.openingTo} - ${detailsModell.openingTo}  ]",
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
          Center(
            child: Container(   width: 400,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01, ),

                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Photos",
    style:
    GoogleFonts.alef(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  SizedBox(
                    height: 230,
                    width: 500,
                    child: Column(
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                              height: 200,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              padEnds: true,
                              pauseAutoPlayOnTouch: true,
                              pageSnapping: true,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              reverse: false,
                              disableCenter: true,
                              enableInfiniteScroll: false,
                              onPageChanged: (index, reason) {
                                placesDetailsState.currentIndex = index;
                                print(placesDetailsState.currentIndex);
                                placesDetailsState.refresh();
                              }),
                          itemCount: detailsModell.albums!.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>

                              CustomNetworkImage(
                            thumbnail:
                            detailsModell.albums![itemIndex].image.toString() ,

                            imageSource: placesDetailsState.imagesUrl,
                            indexPage: itemIndex, text: 'Photos',
                          )


                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: detailsModell.albums!
                                .map((e) => Container(
                              width: 5.0,
                              height: 5.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: placesDetailsState.currentIndex ==
                                      detailsModell.albums!.indexOf(e)
                                      ? Colors.black
                                      : Colors.grey),
                            ))
                                .toList() //
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
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
                  style:
                  GoogleFonts.alef(fontSize: 20, fontWeight: FontWeight.bold)),
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
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder( gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (2/5),

                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: detailsModell.favorites!.length,
                    itemBuilder: (context, index) {
                      return
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child:

                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              children: [

                                Container(

                                  decoration: BoxDecoration(



                                    borderRadius:
                                    BorderRadius.only(
                                      bottomLeft:Radius.circular(5),
                                      topLeft: Radius.circular(5)
                                  ),),
width: 60,height: 60,

                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),

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
                                Text("Christian Zakhour",style: GoogleFonts.comfortaa(fontSize: 12,fontWeight: FontWeight.bold),)
                              ],
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
          ):
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
