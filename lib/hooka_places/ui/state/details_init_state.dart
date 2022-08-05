import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/images/images.dart';
import '../../../utils/style/colors.dart';
import '../../request/isfav_request.dart';
import '../../response/details_response.dart';
import '../screen/places_details.dart';

class DetailsInitState extends States {
  final PlacesDetailsState placesDetailsState;
  final DetailsRep detailsModell;

  DetailsInitState(this.placesDetailsState,this.detailsModell);

  bool isFavvvv=false;
  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PlayAnimation<double>(
              duration: Duration(milliseconds: 1200),
              // delay: Duration(milliseconds: 400),
              tween: Tween(begin: 0.0, end: 250),
              builder: (context, child, value) {
                return
                  Stack(
                    children:[
                      Container(
                    height: value,
                    child: Center(
                        child:
                        CachedNetworkImage(
                          imageUrl: detailsModell.image.toString(),height: 600,fit: BoxFit.cover,
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
                ),
                      Positioned(
                          left:375,
                          top:198,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10),
                          ),

                              child: IconButton(onPressed: (){
                                isFavvvv=!isFavvvv;
                                placesDetailsState.refresh();
                                placesDetailsState.isFav(
                                    IsFavorite(isFav: isFavvvv, ),detailsModell.id.toString() );

                              },

                                  icon:
                isFavvvv?
                                  Icon(Icons.favorite,size: 35,color:Colors.red):
                Icon(Icons.favorite_border,size: 30,))

                          ))
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
                Text(
                    detailsModell.name.toString(),

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
              child: Text(
                  detailsModell.location.toString(),

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
              child: Expanded(

                child: Container(

                  child: Card(
                    color: Colors.red[100],
                    child: SizedBox(
                      width: 160,
                      height: 20,
                      child: Center(
                        child: Text(
                            detailsModell.cuisine.toString(),

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

                Text("Opening hours [${detailsModell.openingFrom} - ${detailsModell.openingTo}]",
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
              child: Text( detailsModell.description.toString(),
                  style:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Favorite To",
                  style:
                  TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
      Container(
        height: 130,
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
   shrinkWrap: true,
        itemCount:detailsModell.favorites!.length,
        itemBuilder: (context, index) {
        return
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 270),
              child: Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),

                Container(

                  decoration:
                  detailsModell.favorites![index].isAvailable==true?
                  BoxDecoration(
          borderRadius:BorderRadius.circular(80),
                    color:Colors.green,

          ):
                  BoxDecoration(
                    borderRadius:BorderRadius.circular(80),
                    color:Colors.red,

                  )
                  ,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Center(

                          child:
                          CachedNetworkImage(
                            imageUrl:detailsModell.favorites![index].image.toString(),fit: BoxFit.cover,
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
                              padding: const EdgeInsets.all(15.0),
                              child: LoadingIndicator(

                                indicatorType:
                                Indicator.ballBeat,


                                colors: [Colors.black],
                              ),),
                            errorWidget: (context, url, error) => Icon(Icons.error),





                          )),
                    ),
                  ),
                ),]));

        }),
      ),


          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ElevatedButton(
            onPressed: () {},
//

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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Album",
                  style:
                  TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount:detailsModell.albums!.length,
                itemBuilder: (context, index) {
                  return
                    Padding(
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
                                  CachedNetworkImage(
                                    imageUrl:detailsModell.albums![index].image.toString(),height: 120,fit: BoxFit.cover,
                                    imageBuilder: (context, imageProvider) => Container(
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

                                        indicatorType:
                                        Indicator.ballBeat,


                                        colors: [Colors.black],
                                      ),),
                                    errorWidget: (context, url, error) => Icon(Icons.error),





                                  )),
                            ),
                          ),]));}),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
        ],
      ),
    );
  }

}