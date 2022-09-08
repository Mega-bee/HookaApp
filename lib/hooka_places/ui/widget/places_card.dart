import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooka/hooka_places/response/places_response.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:neon/neon.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utils/style/colors.dart';

import '../../places_routes.dart';
import '../model/places_card_model.dart';
import '../screen/places_details.dart';

class PlacesCard extends StatefulWidget {
  final PlacesResp ? modelp;
  PlacesCard({this.modelp});




  @override
  State<PlacesCard> createState() => _PlacesCardState();
}

class _PlacesCardState extends State<PlacesCard> {

  @override
  Widget build(BuildContext context) {
    return      SizedBox(
height: 400,

      child:
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap:() {
            Navigator.pushNamed(context, PlacesRoutes.Details,
                arguments: widget.modelp!.id.toString());
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),

                  child: Image.asset("assets/images/restaurant-939435_960_720-768x512.jpeg",fit: BoxFit.contain,

                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                ListTile(title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.modelp!.name.toString()),


                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),

                        color:
                        widget.modelp!.rating! <= 2?
                      Colors.red:
                        widget.modelp!.rating! <= 4?
                        Colors.orange:Colors.green[700],),
                        width: 50,height: 20,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.modelp!.rating.toString(),style: TextStyle(

                                color: Colors.white,fontSize: 15),),
                            Icon(Icons.star,size: 10,color: Colors.white,)
                          ],
                        )),

                  ],
                ),


                  subtitle: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(children: [
                      SizedBox(height: 5,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.modelp!.cuisine.toString()),
                          Icon(Icons.fastfood_outlined,size: 10,)
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.modelp!.location.toString()),
                          Icon(Icons.location_on_outlined,size: 10,),

                        ],
                      ),
                      SizedBox(height: 5,),


                    ],),
                  ),

                  // width: 140, height: 140, fit: BoxFit.cover,
                ),



              ],
              ),
            ),
          ),
        ),
      ),
    );


  }
}
