import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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

  final Function?  isFavFunc ;
  PlacesCard({this.modelp,this.isFavFunc});




  @override
  State<PlacesCard> createState() => _PlacesCardState();
}

class _PlacesCardState extends State<PlacesCard> {
   bool  isFavv=false;
  @override
  Widget build(BuildContext context) {
  final distance= widget.modelp!.distance!/1000;
    return
      SizedBox(
height: 390,

      child:
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap:() {
            Navigator.pushNamed(context, PlacesRoutes.Details,
                arguments: widget.modelp!.id.toString());
          },

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                  Stack(
                    children:[ 
                    //   ClipRRect(
                    //   borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                    //
                    //   child: Image.asset(widget.modelp!.image.toString(),fit: BoxFit.contain,
                    //
                    //   ),
                    // ),
                      CachedNetworkImage(
                        imageUrl: widget.modelp!.image.toString(),
                        fit: BoxFit.cover,
                        height: 180,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballBeat,
                              colors: [Colors.black],
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                      ),

                      widget.modelp!.distance==0?Container():
                      Positioned(
                        left: 320,
                        bottom: 13,
                        child: Container(
                          height: 28,
                          color: Colors.transparent,
                          
                          child: Card(
                            color: Color.fromRGBO(230, 230, 230, 0.5),

                            child: Center(
                              child: Text(" ${distance.toStringAsFixed(1)} km ",style: TextStyle(
fontWeight: FontWeight.bold
                              ),
                        ),
                            ),
                          ),
                      ))


                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  ListTile(title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.modelp!.name.toString(),style:  GoogleFonts.alef(fontWeight: FontWeight.bold,fontSize: 21),),


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
                              Text(widget.modelp!.rating.toString(),style:  GoogleFonts.anekLatin(

                                  color: Colors.white,fontSize: 15),),
                              Icon(Icons.star,size: 10,color: Colors.white,)
                            ],
                          )),

                    ],
                  ),


                    subtitle: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(children: [
                        SizedBox(height: 3,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.modelp!.cuisine.toString(),style: GoogleFonts.anekLatin(
                              color: Colors.black
                            ),),


                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child:

                              InkWell(
                                onTap: (){  widget.isFavFunc!(isFavv);
                                  isFavv =!isFavv;
                                  setState(() {

                            });},
                                child:
                              isFavv !=widget.modelp!.isInFavorite?
                              Icon(Icons.favorite,size: 27,color: Colors.yellow[600] ,): Icon(Icons.favorite_border,size: 27,color: Colors.yellow[600] ,),



                              ),
                            ),




                          ],
                        ),

                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.modelp!.location.toString(),
                                style: GoogleFonts.anekLatin(
                                    fontStyle: FontStyle.italic,fontSize: 12
                                )
                            ),




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
      ),
    );


  }
}
