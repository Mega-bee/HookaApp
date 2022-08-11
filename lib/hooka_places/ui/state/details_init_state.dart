import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooka/hooka_buddies/buddies_routes.dart';
import 'package:hooka/hooka_places/request/addreview_request.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/components/CustomVerificationDialog.dart';
import '../../../utils/style/colors.dart';
import '../../request/isfav_request.dart';
import '../../response/details_response.dart';
import '../screen/places_details.dart';

class DetailsInitState extends States {
  final PlacesDetailsState placesDetailsState;
  final DetailsRep detailsModell;

  DetailsInitState(this.placesDetailsState, this.detailsModell);

  bool isFavvvv = true;
  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlayAnimation<double>(
              duration: Duration(milliseconds: 1200),
              tween: Tween(begin: 0.0, end: 250),
              builder: (context, child, value) {
                return Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                  Container(
                    height: value,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: detailsModell.image.toString(),
                        height: 600,
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
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
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
                                      size: 35, color: Colors.red)
                                  : Icon(
                                      Icons.favorite_border,
                                      size: 30,
                                    ))),
                    alignment: AlignmentDirectional.bottomEnd,)
                ]);
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(detailsModell.name.toString(),
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Container(
                  height: 30,
                  width: 70,
                  color: Colors.transparent,
                  child: Card(
                      color: Colors.green,
                      child: Center(
                          child: Text(detailsModell.rating.toString(),
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white)))),
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
              child: Text(detailsModell.location.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
                  color: Colors.red[100],
                  child: SizedBox(
                    width: 160,
                    height: 20,
                    child: Center(
                      child: Text(detailsModell.cuisine.toString(),
                          style: TextStyle(
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
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
              ]),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Container(
              color: Colors.grey,
              height: 1,
              width: MediaQuery.of(context).size.width * 0.82,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Text("Description",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(detailsModell.description.toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10, top: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Favorite To",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 35),
            child: SizedBox(
              height: 120,
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
                            width: 70,
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
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, BuddiesRoutes.Buddies,arguments: detailsModell.id);
              },
              child: const Text(
                'INVITE BUDDY ',
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Reviews",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Album",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            ),
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
                                child: CachedNetworkImage(
                              imageUrl:
                                  detailsModell.albums![index].image.toString(),
                              height: 120,
                              fit: BoxFit.cover,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.contain,
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
                            )),
                          ),
                        ),
                      ]));
                }),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
        ],
      ),
    );
  }
}
